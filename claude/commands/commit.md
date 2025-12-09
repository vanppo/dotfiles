# Intelligent Git Commit

Smartly commit git changes with AI-generated commit messages and automatic pre-commit hook handling. Understands partial file changes and descriptions in natural language.

**Arguments**: $ARGUMENTS (description of what to commit, optional)

## Phase 1: Analyze All Changes

First, let me understand what changes exist in the repository:

Use Bash tool to run:
```bash
git status --porcelain
git diff --stat
```

## Phase 2: Match User Intent to Changes

Based on the arguments provided, determine what to stage:

1. **No arguments**: Stage all unstaged changes
2. **File paths mentioned**: Stage only those files
3. **Functional description**: Use AI to find relevant changes

Use Bash tool to:
- If arguments contain file paths: `git add <matching-files>`
- If no arguments: `git add .`
- If functional description: need to analyze diffs

## Phase 3: Generate Smart Commit Message

Analyze staged changes and generate a conventional commit message:

Use Bash tool to run:
```bash
git diff --cached --stat
git diff --cached --name-only
```

Based on the changes:
- Identify file types and directories affected
- Categorize changes (feat, fix, docs, refactor, etc.)
- Generate conventional commit format

If user provided description, incorporate it meaningfully.

## Phase 4: Commit with Pre-commit Handling

Attempt the commit:

Use Bash tool to run:
```bash
git commit -m "<generated-message>"
```

If commit fails due to pre-commit hooks:
1. Check the error output
2. Run auto-fixes for common issues:
   - Formatting: `prettier --write .` or `black .`
   - Linting: `eslint --fix .` or `ruff --fix .`
3. Restage fixed files
4. Retry commit

If still fails:
- Show the error to user
- Provide specific fix instructions
- Leave changes staged for manual retry

## Success Criteria

- ✅ Changes properly staged based on user intent
- ✅ Commit message follows conventional format
- ✅ Pre-commit hooks pass (after auto-fixes if needed)
- ✅ User gets clear feedback about what was committed

## Error Handling

Never use --no-verify to bypass hooks. Instead:
- Analyze hook failures
- Attempt automated fixes
- Guide user through manual resolution
- Preserve staged changes for retry
