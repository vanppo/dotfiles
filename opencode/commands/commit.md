---
description: Commit the requested changes with a scoped Conventional Commit
---

Commit changes using a Conventional Commit message (`type(scope): summary`).

**Target Scope:** $ARGUMENTS

### Execution Rules

1. **Determine Target:**
   - If **Target Scope** above is empty, target **all local changes** (staged, unstaged, and untracked, excluding ignored files).
   - If Target Scope specifies files, paths, or "staged changes", restrict your action **strictly** to that scope. Do not include unrelated changes.

2. **Safety & Verification:**
   - Inspect `git status` and relevant diffs before committing.
   - If the target scope cannot be safely isolated or is ambiguous, ask for clarification.
   - If there is nothing to commit in the target scope, inform the user and abort (do not create an empty commit).

3. **Commit Convention:**
   - Format: `type(scope): summary` (e.g., `feat(auth): add login validation`).
   - Use standard types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`.
