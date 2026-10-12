#!/usr/bin/env bash
# Records goldens on Linux through the "Update goldens" workflow, waits for it,
# then pulls the commit it pushed. Run from any branch that is pushed.
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
branch="$(git rev-parse --abbrev-ref HEAD)"

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Commit or stash your changes first; the workflow runs on the pushed branch." >&2
  exit 1
fi
if [[ "$(git rev-parse HEAD)" != "$(git rev-parse "origin/$branch" 2>/dev/null)" ]]; then
  echo "Push $branch first: git push origin $branch" >&2
  exit 1
fi

started="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
gh workflow run update-goldens.yml --ref "$branch"

run_id=""
for _ in $(seq 1 30); do
  run_id="$(gh run list --workflow update-goldens.yml --branch "$branch" \
    --created ">=$started" --limit 1 --json databaseId --jq '.[0].databaseId // empty')"
  [[ -n "$run_id" ]] && break
  sleep 2
done
if [[ -z "$run_id" ]]; then
  echo "Workflow run did not start; check: gh run list --workflow update-goldens.yml" >&2
  exit 1
fi

gh run watch "$run_id" --exit-status
git pull --ff-only origin "$branch"
echo "Goldens recorded on Linux. Review the image changes in: git show --stat HEAD"
