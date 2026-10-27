#!/usr/bin/env bash
# PreToolUse 훅: build.gradle을 고치려고 하면 어떤 모드에서든 사용자에게 확인을 받는다.
# 종료 코드 0과 함께 JSON을 출력해서 "ask" 결정을 알려 준다.

cat > /dev/null

cat <<'JSON'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "ask",
    "permissionDecisionReason": "build.gradle은 의존성과 빌드 설정을 바꾸는 파일이에요. 변경 내용을 확인해 주세요."
  }
}
JSON
