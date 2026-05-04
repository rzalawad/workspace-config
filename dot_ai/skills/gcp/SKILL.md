---
name: gcp
description: Commit and push the current Git branch directly to origin. Use when the user asks to run gcp, commit and push, or create a direct commit without opening a PR or creating a branch.
---

# Git Commit Push

Commit the current repository changes and push directly to the current branch.

## Workflow

1. Inspect the repository state:
   - `git status --short`
   - `git diff HEAD`
   - `git log --oneline -5`
2. Create one focused commit with a message that follows the repository's commit style.
3. Push directly to `origin` on the current branch.

## Constraints

- Do not create a new branch.
- Do not open a pull request.
- Do not include `Co-Authored-By` trailers.
- Do not revert user changes.
- If the worktree contains unrelated changes that should not be included, stop and ask before committing.
