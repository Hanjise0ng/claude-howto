---
name: spring-test-writer
description: Spring Boot 코드의 테스트를 작성하거나, 버그를 테스트 먼저(TDD) 방식으로 고친다. "테스트 만들어 줘", "테스트 추가", "TDD로 고쳐 줘", "버그 재현 테스트" 같은 요청에 사용한다.
argument-hint: [테스트할 클래스 또는 고칠 버그 설명]
---

# Spring 테스트 작성

대상: $ARGUMENTS

## 작업 순서

1. **대상 파악**: 대상 클래스와 연결된 Controller, Service, Repository, DTO를 읽는다.
2. **테스트 목록 제안**: 성공 경우, 실패 경우(없는 데이터, 잘못된 입력), 경계 경우를 표로 정리해 보여 주고 확인을 받는다.
3. **테스트 먼저 작성**: 확인받은 목록대로 테스트를 쓴다. 작성 규칙은 [references/test-conventions.md](references/test-conventions.md)를 따른다. API 테스트는 [templates/ApiTestTemplate.java](templates/ApiTestTemplate.java)의 형식을 쓴다.
4. **실행**: `./gradlew test`를 실행한다.
5. **버그를 고치는 경우**:
   - 고치기 전에 새 테스트가 **실패하는 것**을 먼저 보여 준다 (Red).
   - 테스트를 통과시키는 **가장 작은 수정**을 한다 (Green).
   - 다시 `./gradlew test`로 전체 테스트가 통과하는지 확인한다.
6. **보고**: 추가한 테스트 목록, 실패 → 통과 과정, 고친 파일을 3줄 이내로 요약한다.

## 하지 말 것

- 테스트를 통과시키려고 테스트의 기대값을 바꾸지 않는다.
- 요청받지 않은 코드를 리팩터링하지 않는다.
