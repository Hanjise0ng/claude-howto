---
paths: src/main/java/**/*Controller.java
---

# Controller 작성 규칙

- URL은 `/api/복수형-명사` 형식을 쓴다 (예: `/api/posts`)
- 생성은 `201 Created`, 삭제는 `204 No Content`를 응답한다
- 요청 본문에는 `@Valid`를 붙여 입력값을 검증한다
- 비즈니스 로직을 넣지 않는다. Service를 호출하고 결과를 그대로 돌려준다
