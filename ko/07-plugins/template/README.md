# spring-dev-kit

Spring Boot 백엔드 개발을 도와주는 Claude Code 플러그인입니다. 코드 설명, 버그 찾기, 테스트 작성, PR 설명 작성 스킬과 보안·코드 리뷰 에이전트, 위험한 셸 명령을 막는 훅이 들어 있어요.

## 들어 있는 것

| 종류 | 이름 | 하는 일 |
|---|---|---|
| 스킬 | `/spring-dev-kit:explain` | 코드나 개념을 신입 눈높이로 설명 |
| 스킬 | `/spring-dev-kit:find-bug` | 원인 추적 → 수정안 → 허락 후 수정 → 테스트 |
| 스킬 | `/spring-dev-kit:spring-test-writer` | 테스트 작성, TDD로 버그 수정 |
| 스킬 | `/spring-dev-kit:pr-description` | 브랜치 변경으로 PR 설명 작성 |
| 에이전트 | `security-reviewer` | 읽기 전용 보안 리뷰 |
| 에이전트 | `spring-code-reviewer` | 읽기 전용 코드 리뷰 |
| 훅 | 위험 명령 차단 | `rm -rf`, `git push --force` 등 실행 차단 |

## 설치

```text
/plugin marketplace add 내아이디/spring-dev-kit
/plugin install spring-dev-kit@my-dev-tools
```

## 요구 사항

- Claude Code 최신 버전
- 훅 실행용 bash (Windows는 Git Bash)
