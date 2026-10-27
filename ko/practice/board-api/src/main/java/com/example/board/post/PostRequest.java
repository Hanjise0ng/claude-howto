package com.example.board.post;

public record PostRequest(String title, String content, Long authorId) {
}
