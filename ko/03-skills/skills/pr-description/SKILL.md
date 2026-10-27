---
name: pr-description
description: 현재 브랜치의 변경 사항으로 PR 제목과 설명을 작성한다. PR을 올리기 전에 사용한다.
argument-hint: [선택: 관련 이슈 번호]
disable-model-invocation: true
allowed-tools: Bash(git diff *), Bash(git log *), Bash(git branch *)
---

# PR 설명 작성

## 현재 상태

- 브랜치: !`git branch --show-current`
- 커밋: !`git log --oneline main..HEAD`
- 바뀐 파일: !`git diff --stat main...HEAD`

## 할 일

위 변경으로 PR 제목과 설명을 작성하세요. 관련 이슈: $ARGUMENTS

필요하면 `git diff main...HEAD`로 자세한 변경을 읽으세요. 아래 형식을 지키세요.

```markdown
## 무엇을 바꿨나요

## 왜 바꿨나요

## 어떻게 확인했나요
- [ ] ./gradlew test 통과
- 확인용 curl 명령:

## 리뷰어가 봐 주면 좋은 부분
```

- 제목은 `타입: 요약` 형식, 한국어 50자 이내
- 관련 이슈가 있으면 본문 끝에 `Closes #번호`
- 작성만 하고, PR은 만들지 마세요
