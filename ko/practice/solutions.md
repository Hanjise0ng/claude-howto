# 🔑 board-api 참고 풀이

> ⚠️ **미션을 직접 해 본 뒤에 여세요.** 정답을 먼저 보면 Claude Code를 쓰는 연습도, 코드를 이해하는 연습도 되지 않아요.
>
> 아래 풀이는 **여러 정답 중 하나**예요. Claude가 다른 방법으로 고쳤어도 테스트가 통과하고 이유를 설명할 수 있으면 괜찮아요. 모든 코드는 Spring Boot 4.1.1, Java 21에서 빌드와 테스트를 마쳤어요.

## 목차

| # | 문제 | 장 |
|---|---|---|
| 1 | [없는 게시글 조회 시 500](#1-없는-게시글-조회-시-500) | 1장 |
| 2 | [테스트 코드 없음](#2-테스트-코드-없음) | 3장 |
| 3 | [빈 제목 저장](#3-빈-제목-저장) | 3장 |
| 4 | [비밀번호 평문 저장](#4-비밀번호-평문-저장) | 4장 |
| 5 | [게시글 목록 N+1](#5-게시글-목록-n1) | 9장 |

---

## 1. 없는 게시글 조회 시 500

**원인:** `postRepository.findById(id).get()`은 값이 없으면 `NoSuchElementException`을 던져요. 아무도 이 예외를 처리하지 않으니 Spring이 500으로 응답했어요.

**풀이:** "찾을 수 없음"을 뜻하는 예외를 만들고, `@RestControllerAdvice`에서 404로 바꿔요.

```java
// common/NotFoundException.java
public class NotFoundException extends RuntimeException {

    public NotFoundException(String message) {
        super(message);
    }
}
```

```java
// common/ErrorResponse.java
public record ErrorResponse(int status, String message) {
}
```

```java
// common/GlobalExceptionHandler.java
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public ErrorResponse handleNotFound(NotFoundException e) {
        return new ErrorResponse(404, e.getMessage());
    }
}
```

```java
// post/PostService.java (일부)
private Post getPost(Long id) {
    return postRepository.findById(id)
            .orElseThrow(() -> new NotFoundException("게시글을 찾을 수 없습니다. id=" + id));
}
```

**확인:**

```bash
curl -i http://localhost:8080/api/posts/999
```

`HTTP/1.1 404`와 `{"status":404,"message":"게시글을 찾을 수 없습니다. id=999"}`가 나와요.

**놓치기 쉬운 곳:** `update()`, `create()`의 회원 조회, `CommentService.create()`에도 같은 `.get()`이 있어요. 하나만 고치면 절반만 고친 거예요.

**🎤 면접 포인트:** "`Optional.get()`은 값이 없을 때 의미 없는 예외를 던져서, `orElseThrow()`로 도메인 예외를 던지고 전역 예외 처리기에서 HTTP 상태 코드로 바꿨습니다."

---

## 2. 테스트 코드 없음

**풀이:** 실제 HTTP 요청처럼 API를 호출해 보는 테스트를 만들어요. `MockMvc`는 서버를 띄우지 않고도 Controller부터 DB까지 한 번에 확인할 수 있게 해 줘요.

```java
// src/test/java/com/example/board/post/PostApiTest.java
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
class PostApiTest {

    @Autowired
    MockMvc mockMvc;

    @Test
    void 게시글_목록을_조회한다() throws Exception {
        mockMvc.perform(get("/api/posts"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.length()").value(3));
    }

    @Test
    void 없는_게시글을_조회하면_404() throws Exception {
        mockMvc.perform(get("/api/posts/999"))
                .andExpect(status().isNotFound());
    }
}
```

> 📝 Spring Boot 4부터 `@AutoConfigureMockMvc`의 패키지가 `org.springframework.boot.webmvc.test.autoconfigure`로 바뀌었어요. 그래서 `build.gradle`에 `spring-boot-starter-webmvc-test`가 들어 있어요. 인터넷의 Spring Boot 3 예제를 그대로 쓰면 import 에러가 날 수 있어요.

**확인:**

```bash
./gradlew test
```

**🎤 면접 포인트:** "`@Transactional`을 테스트에 붙여서 테스트마다 데이터가 롤백되게 했고, 테스트 이름은 한글로 써서 무엇을 검증하는지 바로 읽히게 했습니다."

---

## 3. 빈 제목 저장

**풀이:** 요청 DTO에 검증 규칙을 붙이고, Controller에서 `@Valid`로 검사를 켜고, 검증 실패를 400으로 바꿔요. 3장에서는 **실패하는 테스트를 먼저** 쓰고 고쳐요.

```java
// post/PostRequest.java
public record PostRequest(
        @NotBlank(message = "제목은 비어 있을 수 없습니다.") @Size(max = 100) String title,
        @NotBlank(message = "내용은 비어 있을 수 없습니다.") @Size(max = 2000) String content,
        @NotNull Long authorId) {
}
```

```java
// post/PostController.java (일부)
@PostMapping
@ResponseStatus(HttpStatus.CREATED)
public PostResponse create(@Valid @RequestBody PostRequest request) {
    return postService.create(request);
}
```

```java
// common/GlobalExceptionHandler.java에 추가
@ExceptionHandler(MethodArgumentNotValidException.class)
@ResponseStatus(HttpStatus.BAD_REQUEST)
public ErrorResponse handleInvalid(MethodArgumentNotValidException e) {
    String message = e.getBindingResult().getFieldErrors().stream()
            .map(error -> error.getField() + ": " + error.getDefaultMessage())
            .findFirst()
            .orElse("잘못된 요청입니다.");
    return new ErrorResponse(400, message);
}
```

```java
// PostApiTest에 추가한 테스트 (고치기 전에는 201이 나와서 실패해요)
@Test
void 제목이_비어_있으면_400() throws Exception {
    mockMvc.perform(post("/api/posts")
                    .contentType(MediaType.APPLICATION_JSON)
                    .content("{\"title\":\"\",\"content\":\"내용\",\"authorId\":1}"))
            .andExpect(status().isBadRequest());
}
```

**놓치기 쉬운 곳:** `update()`에도 `@Valid`를 붙여야 수정할 때도 검사돼요.

**🎤 면접 포인트:** "`@NotNull`, `@NotEmpty`, `@NotBlank`의 차이"는 단골 질문이에요. `/explain`으로 정리해 두세요.

---

## 4. 비밀번호 평문 저장

**원인:** 회원가입 때 받은 비밀번호를 그대로 DB에 넣어요. DB가 유출되면 모든 회원의 비밀번호가 그대로 드러나요.

**풀이:** 되돌릴 수 없는 **해시**로 바꿔 저장해요. Spring Security 전체 대신 암호화 모듈만 추가해요.

```groovy
// build.gradle의 dependencies에 추가
implementation 'org.springframework.security:spring-security-crypto'
```

```java
// member/PasswordConfig.java
@Configuration
public class PasswordConfig {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
```

```java
// member/MemberService.java (일부)
String encodedPassword = passwordEncoder.encode(request.password());
Member member = new Member(request.email(), request.name(), encodedPassword);
```

```java
// 검증 테스트
@Test
void 비밀번호는_암호화해서_저장한다() {
    MemberResponse response = memberService.join(new MemberRequest("new@example.com", "신입", "secret123"));

    Member saved = memberRepository.findById(response.id()).orElseThrow();
    assertThat(saved.getPassword()).isNotEqualTo("secret123");
    assertThat(passwordEncoder.matches("secret123", saved.getPassword())).isTrue();
}
```

**남은 숙제:** `data.sql`의 샘플 회원 비밀번호는 아직 평문이에요. 나중에 로그인 기능을 만든다면 샘플 데이터도 해시값으로 바꿔야 해요. 또 `MemberRequest`에도 이메일 형식, 비밀번호 길이 검증이 없어요. 3번 풀이를 응용해 보세요.

**🎤 면접 포인트:** "암호화(되돌릴 수 있음)와 해시(되돌릴 수 없음)의 차이, BCrypt가 같은 비밀번호도 매번 다른 값을 만드는 이유(솔트)"를 설명할 수 있게 준비하세요.

---

## 5. 게시글 목록 N+1

**원인:** `findAll()`로 게시글 3개를 가져온 뒤, `PostResponse.from()`에서 글마다 `getAuthor().getName()`과 `getComments().size()`를 부르면서 **지연 로딩(LAZY)** 이 일어나요. 그래서 SQL이 `1(목록) + 작성자 N + 댓글 N`번 실행돼요. 샘플 데이터에서는 6번이에요.

**풀이:** 목록을 가져올 때 작성자와 댓글을 **한 번에 함께** 가져오게 해요.

```java
// post/PostRepository.java
public interface PostRepository extends JpaRepository<Post, Long> {

    @EntityGraph(attributePaths = {"author", "comments"})
    @Query("select p from Post p")
    List<Post> findAllWithAuthorAndComments();
}
```

```java
// post/PostService.java (일부)
public List<PostResponse> findAll() {
    return postRepository.findAllWithAuthorAndComments().stream()
            .map(PostResponse::from)
            .toList();
}
```

**확인:** 서버를 켜고 `curl http://localhost:8080/api/posts`를 호출한 뒤 로그의 `Hibernate: select` 줄을 세어 보세요. **6번 → 1번**으로 줄어요.

**다른 방법과 비교:**

| 방법 | 장점 | 주의할 점 |
|---|---|---|
| `@EntityGraph` / fetch join (이 풀이) | 쿼리 1번 | 컬렉션을 함께 가져오면 페이징을 DB에서 못 해요 |
| `default_batch_fetch_size` 설정 | 코드 수정이 거의 없고 페이징 가능 | 쿼리가 1번이 아니라 몇 번으로 줄어요 |
| 댓글 수만 따로 집계 쿼리 | 가장 가벼움 | 쿼리를 직접 작성해야 해요 |

9장에서는 계획 모드로 **이 세 가지를 비교한 뒤** 하나를 고르는 연습을 해요.

**🎤 면접 포인트:** "N+1이 무엇이고, 어떻게 발견했고(로그의 쿼리 수), 왜 이 방법을 골랐는지"를 순서대로 말할 수 있으면 좋아요.
