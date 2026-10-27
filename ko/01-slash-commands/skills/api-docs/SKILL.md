---
name: api-docs
description: Controller 코드를 읽고 API 명세서를 Markdown 표로 만든다. API 문서가 필요할 때 사용한다.
argument-hint: [선택: Controller 이름]
---

# API 명세서 만들기

대상: $ARGUMENTS (비어 있으면 프로젝트의 모든 `@RestController`)

1. 대상 Controller와 요청·응답 DTO를 찾아 읽으세요.
2. 아래 표 형식으로 정리하세요.

| 메서드 | URL | 설명 | 요청 본문 | 응답 | 상태 코드 |
|---|---|---|---|---|---|

3. 표 아래에 API마다 `curl` 호출 예시를 하나씩 적으세요.
4. 문서와 코드가 맞지 않거나, 빠진 예외 처리가 보이면 마지막에 "확인 필요" 목록으로 적으세요.
5. 결과는 `docs/api.md`에 저장해도 되는지 물어보세요.
