#!/usr/bin/env bash
#
# Build the site and publish it to the gh-pages branch.
#
# Use this when you want the live site updated immediately, or when
# GitHub Actions is unavailable. Pushing to main normally does this
# automatically via .github/workflows/hugo.yml.
#
#   ./deploy.sh
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

BASE_URL="https://prarthona-foundation.github.io/"
BRANCH="gh-pages"
REMOTE="$(git remote get-url origin)"
SHA="$(git rev-parse --short HEAD)"
STAMP="$(date -u '+%Y-%m-%d %H:%M UTC')"

if ! command -v hugo >/dev/null 2>&1; then
  echo "error: hugo is not installed. Install it with:  brew install hugo" >&2
  exit 1
fi

echo "==> Building site"
rm -rf public resources/_gen
HUGO_ENVIRONMENT=production hugo --gc --minify --baseURL "$BASE_URL"

# Stops GitHub Pages from running the output through Jekyll.
touch public/.nojekyll

echo "==> Publishing to $BRANCH"
cd public
git init -q -b "$BRANCH"
git config user.name "prarthona-foundation"
git config user.email "prarthona.foundation@gmail.com"
git add -A
git commit -q -m "Deploy $SHA - $STAMP"
git push -q --force "$REMOTE" "$BRANCH"
cd "$REPO_ROOT"
rm -rf public/.git

echo "==> Done. Live in about a minute at $BASE_URL"
echo "    (hard-refresh the browser if you still see the old version)"
