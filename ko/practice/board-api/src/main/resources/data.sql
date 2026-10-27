INSERT INTO members (email, name, password) VALUES ('kim@example.com', '김개발', 'password1234');
INSERT INTO members (email, name, password) VALUES ('lee@example.com', '이백엔드', 'qwer1234');

INSERT INTO posts (title, content, author_id) VALUES ('첫 번째 글', 'Spring Boot 공부 시작!', 1);
INSERT INTO posts (title, content, author_id) VALUES ('JPA 질문', '연관관계가 어려워요.', 2);
INSERT INTO posts (title, content, author_id) VALUES ('오늘의 회고', 'REST API를 처음 만들어 봤다.', 1);

INSERT INTO comments (content, post_id, author_id) VALUES ('화이팅!', 1, 2);
INSERT INTO comments (content, post_id, author_id) VALUES ('저도 어려웠어요', 2, 1);
INSERT INTO comments (content, post_id, author_id) VALUES ('좋은 글이네요', 3, 2);
