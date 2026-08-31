from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from scripts.sync_notion import (
    Submission,
    choose_page,
    difficulty_for,
    next_attempt_property,
    page_properties,
    parse_submission,
    sync_submission,
)


class SyncNotionTests(unittest.TestCase):
    def test_programmers_submission_with_review_metadata(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            repo = Path(directory)
            problem = repo / "프로그래머스/2/43165. 타겟 넘버"
            problem.mkdir(parents=True)
            (problem / "README.md").write_text(
                """# [level 2] 타겟 넘버 - 43165

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/43165?language=python3)

### 구분

코딩테스트 연습 > 깊이/너비 우선 탐색(DFS/BFS)

### 제출 일자

2026년 08월 31일 17:07:53
""",
                encoding="utf-8",
            )
            source_path = problem.relative_to(repo) / "타겟 넘버.py"
            (repo / source_path).write_text(
                "# @time 7\n# @tags DFS, 재귀, 완전탐색\ndef solution(): pass\n",
                encoding="utf-8",
            )

            submission = parse_submission(repo, source_path, "abc123", "99yuseong/Algorithm")

            self.assertIsNotNone(submission)
            assert submission is not None
            self.assertEqual(submission.solve_time, 7)
            self.assertEqual(submission.tags, ("DFS", "재귀", "완전탐색"))
            self.assertTrue(submission.tags_are_manual)
            self.assertEqual(submission.difficulty, "level2")
            self.assertEqual(submission.submitted_date, "2026-08-31")
            self.assertEqual(
                submission.problem_url,
                "https://school.programmers.co.kr/learn/courses/30/lessons/43165",
            )

    def test_difficulty_mapping(self) -> None:
        self.assertEqual(difficulty_for("프로그래머스", "level 3"), "level3")
        self.assertEqual(difficulty_for("백준", "Gold IV"), "골드 4")
        self.assertEqual(difficulty_for("백준", "Silver II"), "실버 2")
        self.assertIsNone(difficulty_for("백준", "Platinum V"))

    def test_next_attempt_property(self) -> None:
        page = {
            "properties": {
                "1차": {"number": -1},
                "2차": {"number": 15},
                "3차": {"number": None},
            }
        }
        self.assertEqual(next_attempt_property(page), "3차")

    def test_choose_page_prefers_matching_problem_id(self) -> None:
        submission = Submission(
            site="프로그래머스",
            problem_id="42628",
            title="이중우선순위큐",
            difficulty="level3",
            problem_url="https://school.programmers.co.kr/learn/courses/30/lessons/42628",
            submitted_date="2026-08-31",
            source_path="solution.py",
            language="python",
            source="pass",
            solve_time=12,
            tags=("Heap",),
            tags_are_manual=False,
            commit_sha="abc",
            commit_url="https://github.com/example/commit/abc",
        )
        pages = [
            {
                "id": "wrong",
                "last_edited_time": "2026-08-31T00:00:00Z",
                "properties": {
                    "URL": {"url": "https://example.com/other"},
                    "1차": {"number": 10},
                    "2차": {"number": 10},
                    "3차": {"number": None},
                },
            },
            {
                "id": "right",
                "last_edited_time": "2026-01-01T00:00:00Z",
                "properties": {
                    "URL": {"url": "https://school.programmers.co.kr/learn/courses/30/lessons/42628?language=python3"},
                    "1차": {"number": -1},
                    "2차": {"number": None},
                    "3차": {"number": None},
                },
            },
        ]
        self.assertEqual(choose_page(pages, submission)["id"], "right")

    def test_inferred_tags_do_not_replace_existing_tags(self) -> None:
        submission = Submission(
            site="프로그래머스",
            problem_id="43165",
            title="타겟 넘버",
            difficulty="level2",
            problem_url="https://school.programmers.co.kr/learn/courses/30/lessons/43165",
            submitted_date="2026-08-31",
            source_path="solution.py",
            language="python",
            source="pass",
            solve_time=None,
            tags=("DFS", "BFS"),
            tags_are_manual=False,
            commit_sha="abc",
            commit_url="https://github.com/example/commit/abc",
        )

        properties = page_properties(submission, None, creating=False)

        self.assertNotIn("키워드", properties)

    def test_sync_uses_next_attempt_and_merges_manual_tags(self) -> None:
        submission = Submission(
            site="프로그래머스",
            problem_id="43165",
            title="타겟 넘버",
            difficulty="level2",
            problem_url="https://school.programmers.co.kr/learn/courses/30/lessons/43165",
            submitted_date="2026-08-31",
            source_path="solution.py",
            language="python",
            source="# @time 12\n# @tags 재귀\npass",
            solve_time=12,
            tags=("재귀",),
            tags_are_manual=True,
            commit_sha="abc",
            commit_url="https://github.com/example/commit/abc",
        )
        page = {
            "id": "page-id",
            "last_edited_time": "2026-08-30T00:00:00Z",
            "properties": {
                "URL": {"url": submission.problem_url},
                "1차": {"number": 7},
                "2차": {"number": None},
                "3차": {"number": None},
                "키워드": {"multi_select": [{"name": "DFS"}]},
                "푼 날짜": {"date": {"start": "2026-08-30"}},
            },
        }

        class FakeClient:
            def __init__(self) -> None:
                self.updated = None
                self.appended = None

            def find_pages(self, _submission):
                return [page]

            def has_marker(self, _page_id, _marker):
                return False

            def update_page(self, page_id, properties):
                self.updated = (page_id, properties)

            def append_children(self, page_id, children):
                self.appended = (page_id, children)

        client = FakeClient()

        result = sync_submission(client, submission)

        assert client.updated is not None
        _, properties = client.updated
        self.assertEqual(properties["2차"]["number"], 12)
        self.assertEqual(
            [option["name"] for option in properties["키워드"]["multi_select"]],
            ["DFS", "재귀"],
        )
        self.assertIn("2차=12분", result)


if __name__ == "__main__":
    unittest.main()
