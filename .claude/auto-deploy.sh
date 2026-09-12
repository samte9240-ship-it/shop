#!/bin/sh
# 작업이 끝날 때마다 실행됩니다.
# 1) 바뀐 게 있으면 깃허브에 올리고  2) 브라우저로 페이지를 엽니다.

cd "$(dirname "$0")/.." || exit 0

# 비밀번호 입력창이 떠서 멈추는 일이 없게 합니다.
export GIT_TERMINAL_PROMPT=0

# 바뀐 파일이 있을 때만 올립니다.
if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
  git add -A 2>/dev/null
  git commit -q -m "자동 저장: $(date '+%Y-%m-%d %H:%M')" 2>/dev/null
  git push -q origin main 2>/dev/null
fi

# 브라우저로 열기
powershell -NoProfile -Command "if (Test-Path 'index.html') { Start-Process (Resolve-Path 'index.html').Path }" 2>/dev/null

exit 0
