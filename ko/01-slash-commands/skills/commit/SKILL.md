---
name: commit
description: 현재 변경 사항을 분석해 Conventional Commits 형식의 한국어 커밋 메시지로 커밋한다.
argument-hint: [선택: 커밋에 대한 추가 설명]
disable-model-invocation: true
allowed-tools: Bash(git status *), Bash(git diff *), Bash(git log *), Bash(git add *), Bash(git commit *)
---

# 커밋하기

## 현재 상태

- 변경된 파일: !`git status --short`
- 변경 내용: !`git diff HEAD`
- 최근 커밋: !`git log --oneline -5`

## 할 일

위 변경 사항으로 커밋 하나를 만드세요. 추가 설명: $ARGUMENTS

- 형식: `타입: 제목` (타입은 feat, fix, refactor, test, docs, chore 중 하나)
- 제목은 한국어로 50자 이내, 무엇을 왜 바꿨는지 드러나게
- 본문에는 바뀐 내용을 2~3줄로 정리
- 커밋하기 전에 메시지를 보여 주고 확인을 받으세요
