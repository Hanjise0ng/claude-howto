# board-api: 실습용 게시판 REST API

이 가이드의 **모든 장에서 함께 쓰는 실습 프로젝트**입니다. 회원, 게시글, 댓글 기능이 있는 작은 Spring Boot 서버예요.

![board-api의 계층 구조를 식당에 비유한 그림](../../images/00-board-api-layers.svg)

> ⚠️ **일부러 문제를 숨겨 둔 프로젝트입니다.** 신입 개발자가 입사해서 처음 받는 코드처럼, 동작은 하지만 고쳐야 할 곳이 있어요. 장을 하나씩 진행하면서 Claude Code로 찾아 고칩니다. 정답은 미리 보지 말고 직접 찾아보세요.

## 준비물

| 도구 | 버전 | 확인 명령 |
|---|---|---|
| JDK | 21 이상 | `java -version` |
| Git | 아무 버전 | `git --version` |
| Claude Code | 최신 | `claude --version` |

Gradle은 따로 설치하지 않아도 됩니다. 프로젝트에 들어 있는 `gradlew`가 알아서 내려받아요.

## 시작하기

**1. 실습 폴더를 저장소 밖으로 복사합니다.**

이 저장소 안에서 바로 실습하면, 저장소에 있는 CLAUDE.md(튜토리얼 작성 규칙)까지 Claude가 읽어서 헷갈릴 수 있어요. 그래서 홈 폴더로 복사해서 씁니다.

```bash
cp -r ko/practice/board-api ~/board-api
cd ~/board-api
git init && git add . && git commit -m "init: board-api 실습 시작"
```

> 💡 `git commit`까지 해 두면, 실습하다 망가뜨려도 언제든 처음 상태로 돌아올 수 있어요.

**2. 서버를 실행합니다.**

```bash
./gradlew bootRun
```

로그 마지막에 `Started BoardApplication`이 보이면 성공입니다.

> 🪟 Windows는 **Git Bash**에서 실행하세요. PowerShell에서는 `.\gradlew.bat bootRun`을 쓰고, `curl` 대신 `curl.exe`를 입력해야 해요.

**3. API를 호출해 봅니다.** (새 터미널 창에서)

```bash
curl http://localhost:8080/api/posts
```

게시글 3개가 JSON으로 나오면 준비 끝입니다. 서버를 끌 때는 서버 창에서 `Ctrl + C`를 누르세요.

## API 목록

| 기능 | 메서드 | URL | 요청 본문 예시 |
|---|---|---|---|
| 회원가입 | POST | `/api/members` | `{"email":"a@a.com","name":"홍길동","password":"1234"}` |
| 게시글 목록 | GET | `/api/posts` | 없음 |
| 게시글 상세 | GET | `/api/posts/{id}` | 없음 |
| 게시글 작성 | POST | `/api/posts` | `{"title":"제목","content":"내용","authorId":1}` |
| 게시글 수정 | PUT | `/api/posts/{id}` | `{"title":"새 제목","content":"새 내용","authorId":1}` |
| 게시글 삭제 | DELETE | `/api/posts/{id}` | 없음 |
| 댓글 작성 | POST | `/api/posts/{id}/comments` | `{"content":"댓글","authorId":2}` |

서버를 켤 때마다 DB(H2 메모리 DB)가 비워지고 `data.sql`의 샘플 데이터가 다시 들어갑니다.

## 폴더 구조

```text
board-api/
├── build.gradle                  ← 사용하는 라이브러리 목록
├── src/main/java/com/example/board/
│   ├── BoardApplication.java     ← 서버 시작점
│   ├── member/                   ← 회원 기능
│   ├── post/                     ← 게시글 기능
│   └── comment/                  ← 댓글 기능
├── src/main/resources/
│   ├── application.yml           ← 서버 설정
│   └── data.sql                  ← 샘플 데이터
└── src/test/                     ← 테스트 코드 (거의 비어 있음)
```

기능마다 `Controller → Service → Repository` 순서로 파일이 나뉘어 있어요. 위 그림의 식당 비유를 떠올리면서 읽어 보세요.

## 숨은 문제 찾기 미션

아래는 **힌트**만 적었습니다. 어느 장에서 고치는지도 함께 적어 두었어요.

| # | 증상 힌트 | 고치는 장 | 해결 |
|---|---|---|---|
| 1 | 없는 게시글 번호로 조회하면 서버가 이상한 에러를 냅니다 | 1장 | ☐ |
| 2 | 테스트 코드가 사실상 없습니다 | 3장 | ☐ |
| 3 | 제목이 비어 있는 게시글도 저장됩니다 | 3장 | ☐ |
| 4 | 회원 정보를 DB에 저장하는 방식이 위험합니다 | 4장 | ☐ |
| 5 | 게시글 목록을 한 번 조회할 때 SQL이 생각보다 많이 실행됩니다 | 9장 | ☐ |

모든 미션을 끝낸 뒤 내 풀이와 비교하고 싶다면 [참고 풀이](../solutions.md)를 보세요. **미션을 하기 전에는 열지 마세요.**

## 학습용 설정

`.claude/settings.json`에 **Manual 권한 모드**가 들어 있어요. Claude가 파일을 고치거나 명령을 실행할 때마다 물어보게 해서, 무엇이 바뀌는지 하나하나 볼 수 있게 했어요. 9장에서 다른 모드로 바꾸는 법을 배워요.

> 🔍 **스스로 확인해 보기:** 서버 로그에 `Hibernate: select ...`가 SQL 한 줄마다 찍힙니다. `curl http://localhost:8080/api/posts`를 한 번 호출하고 몇 줄이 찍히는지 세어 보세요.
