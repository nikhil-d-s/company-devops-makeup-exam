#!/usr/bin/env bash
set -euo pipefail

echo "Recommended Git demo sequence:"
echo "1. git stash push -m \"wip\""
echo "2. git cherry-pick <commit>"
echo "3. git rebase development"
echo "4. git revert <commit>"
echo "5. git reset --soft <commit>"
echo "6. git checkout -- <deleted-file> or git restore <deleted-file>"
