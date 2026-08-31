#!/usr/bin/env python3
"""Sync BaekjoonHub submissions from this repository to Notion.

The script is dependency-free so it can run on a stock GitHub Actions runner.
It reads problem metadata from BaekjoonHub's README files and optional review
metadata from comments in the submitted source:

    # @time 7
    # @tags DFS, 재귀, 완전탐색

Use ``@time -1`` when the problem was not solved within the time limit.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import subprocess
import sys
import unicodedata
from dataclasses import asdict, dataclass
from datetime import date
from pathlib import Path
from typing import Any, Iterable
from urllib.error import HTTPError, URLError
from urllib.parse import quote, urlencode, urlparse, urlunparse
from urllib.request import Request, urlopen


NOTION_API_BASE = "https://api.notion.com/v1"
NOTION_API_VERSION = "2026-03-11"
SUPPORTED_SOURCE_SUFFIXES = {
    ".py", ".swift", ".java", ".kt", ".kts", ".js", ".ts", ".cpp",
    ".cc", ".c", ".cs", ".go", ".rs", ".sql",
}
TIME_PATTERN = re.compile(
    r"(?mi)^\s*(?:#|//|--|/\*)\s*@time\s*(?:[:=]\s*)?(-?\d+)\b"
)
TAGS_PATTERN = re.compile(
    r"(?mi)^\s*(?:#|//|--|/\*)\s*@tags\s*(?:[:=]\s*)?([^\r\n*]+)"
)
SKIP_PATTERN = re.compile(
    r"(?mi)^\s*(?:#|//|--|/\*)\s*@skip-notion\b"
)


@dataclass(frozen=True)
class Submission:
    site: str
    problem_id: str
    title: str
    difficulty: str | None
    problem_url: str
    submitted_date: str
    source_path: str
    language: str
    source: str
    solve_time: int | None
    tags: tuple[str, ...]
    tags_are_manual: bool
    commit_sha: str
    commit_url: str


def run_git(*args: str, cwd: Path) -> bytes:
    result = subprocess.run(
        ["git", *args], cwd=cwd, check=True, stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    return result.stdout


def changed_paths(repo: Path, before: str | None, after: str) -> list[Path]:
    """Return changed repository paths, preserving Unicode path names."""
    before = (before or "").strip()
    all_zero = before and set(before) == {"0"}
    try:
        if before and not all_zero:
            raw = run_git(
                "diff", "--name-only", "-z", before, after, "--",
                "프로그래머스", "백준", cwd=repo,
            )
        else:
            raw = run_git(
                "show", "--pretty=format:", "--name-only", "-z", after, "--",
                "프로그래머스", "백준", cwd=repo,
            )
    except subprocess.CalledProcessError as error:
        details = error.stderr.decode("utf-8", errors="replace")
        raise RuntimeError(f"변경 파일을 확인하지 못했습니다: {details}") from error
    return [Path(item.decode("utf-8")) for item in raw.split(b"\0") if item]


def _normalized_text(value: str) -> str:
    value = unicodedata.normalize("NFKC", value)
    value = value.replace("\u2005", " ").replace("\u200b", " ")
    return re.sub(r"\s+", " ", value).strip()


def _section(readme: str, heading: str) -> str:
    match = re.search(
        rf"(?ms)^###\s+{re.escape(heading)}\s*$\s*(.*?)(?=^###\s+|\Z)",
        readme,
    )
    return _normalized_text(match.group(1)) if match else ""


def _manual_tags(source: str) -> tuple[str, ...]:
    match = TAGS_PATTERN.search(source)
    if not match:
        return ()
    tags = re.split(r"\s*[,，]\s*", match.group(1).strip())
    return tuple(dict.fromkeys(tag for tag in tags if tag))


def _baekjoon_tags(category: str) -> tuple[str, ...]:
    """Keep every category emitted by BaekjoonHub, without aliasing it."""
    tags = (_normalized_text(tag) for tag in re.split(r"[,，]", category))
    return tuple(dict.fromkeys(tag for tag in tags if tag))


def _inferred_tags(category: str) -> tuple[str, ...]:
    normalized = _normalized_text(category).lower()
    tags: list[str] = []
    mappings = (
        (("깊이 우선 탐색", "dfs"), "DFS"),
        (("너비 우선 탐색", "bfs"), "BFS"),
        (("백트래킹",), "백트래킹"),
        (("완전탐색", "완전 탐색", "brute force"), "완전탐색"),
        (("우선순위 큐", "우선순위큐", "priority queue"), "우선순위큐"),
        (("heap", "힙"), "Heap"),
        (("stack", "스택"), "Stack"),
        (("queue", "큐"), "Queue"),
        (("hash", "해시"), "해시"),
        (("dictionary", "딕셔너리"), "딕셔너리"),
        (("set", "집합"), "Set"),
        (("조합", "combinatorics"), "조합"),
        (("순열", "permutation"), "순열"),
        (("다익스트라", "dijkstra"), "다익스트라"),
        (("그래프", "graph"), "그래프"),
        (("dynamic programming", "다이나믹 프로그래밍", "동적 계획법"), "DP"),
        (("greedy", "그리디"), "그리디"),
        (("binary search", "이분 탐색", "이진 탐색"), "이분탐색"),
        (("two pointer", "투 포인터", "투포인터"), "투포인터"),
        (("simulation", "시뮬레이션", "구현"), "구현"),
    )
    for needles, tag in mappings:
        if any(needle in normalized for needle in needles):
            tags.append(tag)
    return tuple(dict.fromkeys(tags))


def _language_for(path: Path) -> str:
    return {
        ".py": "python", ".swift": "swift", ".java": "java",
        ".kt": "kotlin", ".kts": "kotlin", ".js": "javascript",
        ".ts": "typescript", ".cpp": "c++", ".cc": "c++", ".c": "c",
        ".cs": "c#", ".go": "go", ".rs": "rust", ".sql": "sql",
    }.get(path.suffix.lower(), "plain text")


def _normalized_url(url: str) -> str:
    parsed = urlparse(url.strip())
    return urlunparse((parsed.scheme, parsed.netloc, parsed.path.rstrip("/"), "", "", ""))


def difficulty_for(site: str, raw: str) -> str | None:
    normalized = _normalized_text(raw).lower()
    if site == "프로그래머스":
        match = re.search(r"level\s*(\d+)", normalized)
        return f"level{match.group(1)}" if match else None
    tier_match = re.search(
        r"(bronze|silver|gold)\s*(iv|iii|ii|i|v|\d+)", normalized
    )
    if not tier_match:
        return None
    tier, rank = tier_match.groups()
    roman = {"i": 1, "ii": 2, "iii": 3, "iv": 4, "v": 5}
    rank_number = roman.get(rank, int(rank) if rank.isdigit() else 0)
    korean_tier = {"bronze": "브론즈", "silver": "실버", "gold": "골드"}[tier]
    return f"{korean_tier} {rank_number}"


def parse_submission(
    repo: Path, source_path: Path, commit_sha: str, repository_name: str,
) -> Submission | None:
    absolute_source = repo / source_path
    if not absolute_source.is_file() or source_path.suffix.lower() not in SUPPORTED_SOURCE_SUFFIXES:
        return None
    source = absolute_source.read_text(encoding="utf-8")
    if SKIP_PATTERN.search(source):
        return None
    readme_path = absolute_source.parent / "README.md"
    if not readme_path.is_file():
        raise ValueError(f"README.md가 없습니다: {source_path.parent}")
    readme = readme_path.read_text(encoding="utf-8")
    header = re.search(r"(?m)^#\s+\[([^]]+)]\s+(.+?)\s+-\s+(\d+)\s*$", readme)
    link = re.search(r"\[문제 링크]\((https?://[^)]+)\)", readme)
    if not header or not link:
        relative_readme = readme_path.relative_to(repo)
        raise ValueError(f"BaekjoonHub 메타데이터를 읽지 못했습니다: {relative_readme}")
    raw_difficulty, raw_title, problem_id = header.groups()
    site = "프로그래머스" if source_path.parts[0] == "프로그래머스" else "백준"
    date_match = re.search(
        r"(?m)^###\s+제출 일자\s*$\s*(\d{4})년\s*(\d{1,2})월\s*(\d{1,2})일",
        readme,
    )
    submitted_date = (
        f"{int(date_match.group(1)):04d}-{int(date_match.group(2)):02d}-{int(date_match.group(3)):02d}"
        if date_match else date.today().isoformat()
    )
    category = _section(readme, "구분") or _section(readme, "분류")
    manual_tags = _manual_tags(source)
    if site == "백준":
        # BaekjoonHub already provides authoritative algorithm categories.
        # Preserve every category verbatim so Notion can create missing options.
        tags = tuple(dict.fromkeys((*_baekjoon_tags(category), *manual_tags)))
    else:
        tags = manual_tags or _inferred_tags(category)
    time_match = TIME_PATTERN.search(source)
    solve_time = int(time_match.group(1)) if time_match else None
    return Submission(
        site=site,
        problem_id=problem_id,
        title=_normalized_text(raw_title),
        difficulty=difficulty_for(site, raw_difficulty),
        problem_url=_normalized_url(link.group(1)),
        submitted_date=submitted_date,
        source_path=source_path.as_posix(),
        language=_language_for(source_path),
        source=source,
        solve_time=solve_time,
        tags=tags,
        tags_are_manual=bool(manual_tags),
        commit_sha=commit_sha,
        commit_url=f"https://github.com/{repository_name}/commit/{commit_sha}",
    )


def collect_submissions(
    repo: Path, paths: Iterable[Path], commit_sha: str, repository_name: str,
) -> list[Submission]:
    source_paths = [
        path for path in paths
        if path.suffix.lower() in SUPPORTED_SOURCE_SUFFIXES and (repo / path).is_file()
    ]
    grouped: dict[Path, list[Path]] = {}
    for path in source_paths:
        grouped.setdefault(path.parent, []).append(path)
    submissions: list[Submission] = []
    for candidates in grouped.values():
        candidates.sort(key=lambda path: (
            not bool(TIME_PATTERN.search((repo / path).read_text(encoding="utf-8"))),
            path.as_posix(),
        ))
        submission = parse_submission(repo, candidates[0], commit_sha, repository_name)
        if submission:
            submissions.append(submission)
    return submissions


def _rich_text(content: str, *, link: str | None = None) -> dict[str, Any]:
    text: dict[str, Any] = {"content": content}
    if link:
        text["link"] = {"url": link}
    return {"type": "text", "text": text}


def _chunked_rich_text(content: str, size: int = 1900) -> list[dict[str, Any]]:
    if not content:
        return [_rich_text("")]
    return [_rich_text(content[index:index + size]) for index in range(0, len(content), size)]


class NotionClient:
    def __init__(self, token: str, data_source_id: str) -> None:
        self.token = token
        self.data_source_id = data_source_id

    def request(
        self, method: str, path: str, payload: dict[str, Any] | None = None,
        query_params: dict[str, str] | None = None,
    ) -> dict[str, Any]:
        url = f"{NOTION_API_BASE}{path}"
        if query_params:
            url = f"{url}?{urlencode(query_params)}"
        data = json.dumps(payload, ensure_ascii=False).encode("utf-8") if payload is not None else None
        request = Request(
            url, data=data, method=method,
            headers={
                "Authorization": f"Bearer {self.token}",
                "Notion-Version": NOTION_API_VERSION,
                "Content-Type": "application/json",
            },
        )
        try:
            with urlopen(request, timeout=30) as response:
                return json.loads(response.read().decode("utf-8"))
        except HTTPError as error:
            body = error.read().decode("utf-8", errors="replace")
            raise RuntimeError(f"Notion API {error.code}: {body}") from error
        except URLError as error:
            raise RuntimeError(f"Notion API 연결 실패: {error.reason}") from error

    def find_pages(self, submission: Submission) -> list[dict[str, Any]]:
        result = self.request(
            "POST", f"/data_sources/{quote(self.data_source_id)}/query",
            {
                "filter": {"and": [
                    {"property": "이름", "title": {"equals": submission.title}},
                    {"property": "사이트", "select": {"equals": submission.site}},
                ]},
                "page_size": 100,
            },
        )
        return result.get("results", [])

    def has_marker(self, page_id: str, marker: str) -> bool:
        cursor: str | None = None
        while True:
            params = {"page_size": "100"}
            if cursor:
                params["start_cursor"] = cursor
            result = self.request(
                "GET", f"/blocks/{quote(page_id)}/children", query_params=params,
            )
            for block in result.get("results", []):
                block_type = block.get("type")
                rich_text = block.get(block_type, {}).get("rich_text", [])
                text = "".join(item.get("plain_text", "") for item in rich_text)
                if marker in text:
                    return True
            if not result.get("has_more"):
                return False
            cursor = result.get("next_cursor")

    def create_page(
        self, properties: dict[str, Any], children: list[dict[str, Any]],
    ) -> dict[str, Any]:
        return self.request("POST", "/pages", {
            "parent": {"type": "data_source_id", "data_source_id": self.data_source_id},
            "properties": properties,
            "children": children,
        })

    def update_page(self, page_id: str, properties: dict[str, Any]) -> None:
        if properties:
            self.request("PATCH", f"/pages/{quote(page_id)}", {"properties": properties})

    def append_children(self, page_id: str, children: list[dict[str, Any]]) -> None:
        self.request(
            "PATCH", f"/blocks/{quote(page_id)}/children", {"children": children},
        )


def _property_number(page: dict[str, Any], name: str) -> int | float | None:
    return page.get("properties", {}).get(name, {}).get("number")


def _property_url(page: dict[str, Any], name: str) -> str | None:
    return page.get("properties", {}).get(name, {}).get("url")


def _property_multi_select(page: dict[str, Any], name: str) -> list[str]:
    options = page.get("properties", {}).get(name, {}).get("multi_select", [])
    return [option["name"] for option in options if option.get("name")]


def choose_page(pages: list[dict[str, Any]], submission: Submission) -> dict[str, Any]:
    """Choose a canonical row when an old database contains duplicates."""
    def score(page: dict[str, Any]) -> tuple[int, int, int, str]:
        existing_url = _property_url(page, "URL") or ""
        id_match = int(f"/{submission.problem_id}" in _normalized_url(existing_url))
        attempts = sum(
            _property_number(page, name) is not None for name in ("1차", "2차", "3차")
        )
        has_date = int(page.get("properties", {}).get("푼 날짜", {}).get("date") is not None)
        return id_match, attempts, has_date, page.get("last_edited_time", "")
    return max(pages, key=score)


def next_attempt_property(page: dict[str, Any]) -> str | None:
    for name in ("1차", "2차", "3차"):
        if _property_number(page, name) is None:
            return name
    return None


def page_properties(
    submission: Submission, attempt_property: str | None, *, creating: bool,
) -> dict[str, Any]:
    properties: dict[str, Any] = {
        "URL": {"url": submission.problem_url},
        "푼 날짜": {"date": {"start": submission.submitted_date}},
    }
    if creating:
        properties.update({
            "이름": {"title": [_rich_text(submission.title)]},
            "사이트": {"select": {"name": submission.site}},
        })
    if submission.difficulty:
        properties["난이도"] = {"select": {"name": submission.difficulty}}
    # Inferred tags are useful for new rows, but should not replace tags the
    # user has curated in an existing Notion record. Explicit @tags may update
    # both new and existing rows.
    if submission.tags and (
        creating or submission.tags_are_manual or submission.site == "백준"
    ):
        properties["키워드"] = {
            "multi_select": [{"name": tag} for tag in submission.tags]
        }
    if attempt_property and submission.solve_time is not None:
        properties[attempt_property] = {"number": submission.solve_time}
    return properties


def submission_blocks(submission: Submission, marker: str) -> list[dict[str, Any]]:
    if submission.solve_time is None:
        time_text = "풀이 시간 미기록"
    elif submission.solve_time == -1:
        time_text = "시간 내 미해결 (-1)"
    else:
        time_text = f"풀이 시간 {submission.solve_time}분"
    return [
        {
            "object": "block", "type": "heading_3",
            "heading_3": {"rich_text": [_rich_text(
                f"GitHub 제출 · {submission.submitted_date}"
            )]},
        },
        {
            "object": "block", "type": "paragraph",
            "paragraph": {"rich_text": [
                _rich_text(time_text), _rich_text(" · "),
                _rich_text("커밋", link=submission.commit_url),
                _rich_text(f" · {submission.source_path}"),
            ]},
        },
        {
            "object": "block", "type": "code",
            "code": {
                "language": submission.language,
                "caption": [_rich_text(Path(submission.source_path).name)],
                "rich_text": _chunked_rich_text(submission.source),
            },
        },
        {
            "object": "block", "type": "paragraph",
            "paragraph": {"rich_text": [_rich_text(marker)]},
        },
    ]


def sync_submission(client: NotionClient, submission: Submission) -> str:
    marker = f"notion-sync:{submission.commit_sha}:{submission.source_path}"
    pages = client.find_pages(submission)
    if not pages:
        attempt = "1차" if submission.solve_time is not None else None
        result = client.create_page(
            page_properties(submission, attempt, creating=True),
            submission_blocks(submission, marker),
        )
        return f"생성: {submission.title} ({result.get('url', result.get('id', ''))})"
    page = choose_page(pages, submission)
    page_id = page["id"]
    if client.has_marker(page_id, marker):
        return f"건너뜀(이미 처리): {submission.title}"
    attempt = next_attempt_property(page) if submission.solve_time is not None else None
    properties = page_properties(submission, attempt, creating=False)
    if submission.tags_are_manual or submission.site == "백준":
        merged_tags = list(dict.fromkeys([
            *_property_multi_select(page, "키워드"),
            *submission.tags,
        ]))
        properties["키워드"] = {
            "multi_select": [{"name": tag} for tag in merged_tags]
        }
    client.update_page(page_id, properties)
    client.append_children(page_id, submission_blocks(submission, marker))
    duplicate_note = f", 중복 후보 {len(pages)}개 중 대표 기록 사용" if len(pages) > 1 else ""
    if attempt:
        attempt_note = f", {attempt}={submission.solve_time}분"
    elif submission.solve_time is not None:
        attempt_note = ", 1~3차가 모두 차 있어 시간은 미반영"
    else:
        attempt_note = ", 시간 주석 없음"
    return f"업데이트: {submission.title}{attempt_note}{duplicate_note}"


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--before", default=os.getenv("GITHUB_EVENT_BEFORE"))
    parser.add_argument("--after", default=os.getenv("GITHUB_SHA", "HEAD"))
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv or sys.argv[1:])
    repo = args.repo.resolve()
    repository_name = os.getenv("GITHUB_REPOSITORY", "99yuseong/Algorithm")
    paths = changed_paths(repo, args.before, args.after)
    submissions = collect_submissions(repo, paths, args.after, repository_name)
    if not submissions:
        print("동기화할 제출 소스가 없습니다.")
        return 0
    if args.dry_run:
        for submission in submissions:
            data = asdict(submission)
            data["source"] = f"<{len(submission.source)} chars>"
            print(json.dumps(data, ensure_ascii=False, indent=2))
        return 0
    token = os.getenv("NOTION_TOKEN")
    data_source_id = os.getenv("NOTION_DATA_SOURCE_ID")
    if not token or not data_source_id:
        print(
            "NOTION_TOKEN과 NOTION_DATA_SOURCE_ID를 GitHub Actions Secrets에 설정해야 합니다.",
            file=sys.stderr,
        )
        return 2
    client = NotionClient(token, data_source_id)
    failures = 0
    for submission in submissions:
        try:
            print(sync_submission(client, submission))
        except Exception as error:
            failures += 1
            print(f"실패: {submission.title}: {error}", file=sys.stderr)
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
