## 알고리즘 문제집

백준과 프로그래머스 풀이를 BaekjoonHub로 저장합니다.

## Notion 자동 기록

`main` 브랜치에 새 풀이가 올라오면 GitHub Actions가 문제 README와 소스 코드를 읽어 Notion의 `알고리즘 문제 풀이` 데이터베이스에 반영합니다.

### 풀이 시간과 키워드

제출할 소스에 다음 주석을 추가합니다. 문법에 맞는 주석 기호만 바꾸면 모든 언어에서 사용할 수 있습니다.

```python
# @time 7
# @tags DFS, 재귀, 완전탐색
```

- 제한 시간 안에 못 풀었다면 `@time -1`
- 백준 문제는 BaekjoonHub README의 `분류`를 빠짐없이 그대로 태그로 사용
- Notion에 없는 백준 분류는 새 태그 옵션으로 자동 생성
- 프로그래머스 문제는 `@tags`가 없으면 README의 문제 분류에서 태그를 추론
- 백준에서 `@tags`를 직접 쓰면 README 분류 태그와 합쳐서 기록
- `@time`이 없으면 문제·날짜·코드만 동기화하고 `1차/2차/3차`는 변경하지 않음
- 같은 문제를 다시 제출하면 비어 있는 `1차 → 2차 → 3차` 순서로 기록
- 동기화하지 않을 제출에는 `@skip-notion` 추가

Python 이외의 예시는 다음과 같습니다.

```swift
// @time -1
// @tags Heap, 우선순위큐
```

```sql
-- @time 12
```

### 최초 설정

1. Notion에서 내부 통합을 만들고 읽기·삽입·수정 권한을 부여합니다.
2. `알고리즘 문제 풀이` 데이터베이스의 **연결 추가**에서 해당 통합을 연결합니다.
3. GitHub 저장소의 **Settings → Secrets and variables → Actions**에 다음 Repository secret을 등록합니다.
   - `NOTION_TOKEN`: Notion 내부 통합 토큰
   - `NOTION_DATA_SOURCE_ID`: 자동 기록할 데이터 소스 ID
4. Actions 탭에서 `Sync submissions to Notion`을 한 번 수동 실행해 연결을 확인합니다.

자동화는 문제명과 사이트로 기존 기록을 찾고, 문제 ID가 일치하는 URL을 우선해 갱신합니다. 동일 커밋을 다시 실행해도 회차가 중복 추가되지 않습니다.

### 로컬 확인

최근 커밋을 Notion에 쓰지 않고 파싱만 확인할 수 있습니다.

```bash
python3 scripts/sync_notion.py --after HEAD --dry-run
python3 -m unittest discover -s tests -v
```
