#!/usr/bin/env bash
set -euo pipefail

message="${1:-Update website}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required." >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "gh is required. Install GitHub CLI and authenticate first." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  git add -A
  git commit -m "$message"
else
  echo "No local changes to commit."
fi

git push

commit="$(git rev-parse --short HEAD)"
repo="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"

echo "Waiting for GitHub Pages..."
for _ in {1..30}; do
  status="$(gh api "repos/${repo}/pages/builds/latest" --jq .status 2>/dev/null || true)"
  if [[ "$status" == "built" ]]; then
    break
  fi
  sleep 4
done

echo
echo "Published commit: ${commit}"
echo "Fresh URL: http://getshtout.com/?v=${commit}"
echo
echo "If the browser still shows the old page, DNS is cached upstream. Try again later or use a different network/resolver."
