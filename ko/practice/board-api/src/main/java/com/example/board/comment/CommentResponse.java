package com.example.board.comment;

public record CommentResponse(Long id, String content, String authorName) {

    public static CommentResponse from(Comment comment) {
        return new CommentResponse(comment.getId(), comment.getContent(), comment.getAuthor().getName());
    }
}
