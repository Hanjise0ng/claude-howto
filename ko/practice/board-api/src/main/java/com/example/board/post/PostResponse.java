package com.example.board.post;

public record PostResponse(Long id, String title, String content, String authorName, int commentCount) {

    public static PostResponse from(Post post) {
        return new PostResponse(
                post.getId(),
                post.getTitle(),
                post.getContent(),
                post.getAuthor().getName(),
                post.getComments().size());
    }
}
