# board-api

회원, 게시글, 댓글 기능이 있는 게시판 REST API.

## 기술 스택

- Java 21, Spring Boot 4, Spring Data JPA, H2(메모리 DB), Gradle
- 테스트: JUnit 5, MockMvc

## 자주 쓰는 명령

- 실행: `./gradlew bootRun` (포트 8080)
- 테스트: `./gradlew test`
- 빌드: `./gradlew build`

## 패키지 구조

- 기능별 패키지: `member/`, `post/`, `comment/`
- 각 기능은 `Controller → Service → Repository` 순서로 호출한다
- 공통 코드(예외, 응답 형식)는 `common/`에 둔다

## 코딩 규칙

- Controller는 Service만 호출한다. Repository를 직접 부르지 않는다
- 요청과 응답은 Entity 대신 DTO(`record`)를 쓴다
- 조회 결과가 없으면 `Optional.get()` 대신 `orElseThrow()`로 의미 있는 예외를 던진다
- 생성자 주입을 쓴다. 필드 주입(`@Autowired` 필드)은 쓰지 않는다

## 테스트 규칙

- 코드를 고치면 `./gradlew test`로 확인한다
- 테스트 메서드 이름은 한글로, 무엇을 검증하는지 드러나게 쓴다 (예: `없는_게시글을_조회하면_404`)

## 커밋 규칙

- 형식: `타입: 제목` (feat, fix, refactor, test, docs, chore)
- 제목은 한국어로 50자 이내
