#!/usr/bin/env bash
# PreToolUse 훅: Claude가 위험한 셸 명령을 실행하려고 하면 막는다.
# 종료 코드 2로 끝나면 명령이 실행되지 않고, 에러 메시지가 Claude에게 전달된다.

INPUT=$(cat)

DANGEROUS='rm -rf|git push (-f|--force)|git reset --hard|git clean -f|DROP TABLE|TRUNCATE TABLE'

if echo "$INPUT" | grep -qiE "$DANGEROUS"; then
  MATCHED=$(echo "$INPUT" | grep -oiE "$DANGEROUS" | head -1)
  echo "차단됨: '$MATCHED' 는 되돌리기 어려운 명령이라 이 프로젝트에서는 실행할 수 없어요. 다른 방법을 제안하거나 사용자에게 직접 실행해 달라고 요청하세요." >&2
  exit 2
fi

exit 0
