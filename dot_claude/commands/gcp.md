---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git push:*)  , Bash(git commit:*)
description: Commit and push directly to the current branch (no PR, no branch creation)
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Recent commits: !`git log --oneline -5`

## Your task

Based on the above changes:

1. Create a single commit with an appropriate message following the repo's commit style
2. Push directly to origin (current branch, no new branch, no PR)
3. You have the capability to call multiple tools in a single response. You MUST do all of the above in a single message. Do not use any other tools or do anything else. Do not send any other text or messages besides these tool calls.
