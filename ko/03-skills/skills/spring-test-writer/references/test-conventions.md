# 테스트 작성 규칙

## 이름

- 테스트 클래스: `대상클래스명 + Test` (API 전체를 호출하면 `PostApiTest`처럼 `ApiTest`)
- 테스트 메서드: 한글로, "상황_결과" 형식 (예: `없는_게시글을_조회하면_404`, `제목이_비어_있으면_400`)

## 종류 고르기

| 확인하고 싶은 것 | 쓰는 방법 |
|---|---|
| 요청 → 응답(상태 코드, JSON)까지 전체 흐름 | `@SpringBootTest` + `@AutoConfigureMockMvc` + `MockMvc` |
| Service의 업무 규칙 | `@SpringBootTest` + Service 주입 |
| 복잡한 쿼리 | `@DataJpaTest` |

## Spring Boot 4 import 주의

Spring Boot 4부터 MockMvc 자동 설정 패키지가 바뀌었다.

- `org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc`
- `org.springframework.boot.webmvc.test.autoconfigure.WebMvcTest`

Spring Boot 3의 `org.springframework.boot.test.autoconfigure.web.servlet` 패키지를 쓰면 컴파일 에러가 난다.

## 데이터

- 테스트 클래스에 `@Transactional`을 붙여 테스트마다 데이터가 롤백되게 한다.
- 샘플 데이터(`data.sql`): 회원 1 김개발, 2 이백엔드 / 게시글 1~3 / 댓글 1~3.

## 검증

- 상태 코드는 반드시 검증한다: `status().isOk()`, `isCreated()`, `isNotFound()`, `isBadRequest()`
- JSON 값은 `jsonPath("$.필드")`로 검증한다.
- 하나의 테스트에서는 한 가지 상황만 검증한다.
