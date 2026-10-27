#!/usr/bin/env bash
# PostToolUse 훅: Claude가 .java 파일을 고치면 바로 컴파일해 본다.
# 컴파일에 실패하면 종료 코드 2로 에러를 Claude에게 돌려줘서 스스로 고치게 한다.

INPUT=$(cat)

# 고친 파일이 .java가 아니면 아무것도 하지 않는다.
if ! echo "$INPUT" | grep -q '"file_path"[^,}]*\.java"'; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

if ! OUTPUT=$(./gradlew compileJava -q 2>&1); then
  echo "컴파일 실패! 아래 에러를 보고 코드를 고쳐 주세요." >&2
  echo "$OUTPUT" | grep -E "error:|\.java:[0-9]+" | head -20 >&2
  exit 2
fi

exit 0
