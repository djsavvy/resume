#!/bin/sh

# Usage: 
#   chmod u+x .github/git_hooks/pre-commit.sh
#   cd .git/hooks
#   ln -s ../../.github/git_hooks/pre-commit.sh ./pre-commit


# Stash unsaved changes before running script body 
# (derived from: https://codeinthehole.com/tips/tips-for-using-a-git-pre-commit-hook/)
STASH_NAME="pre-commit-$(date +%s)"
echo "----------- Running pre-commit hook -----------"
echo "Stashing unsaved changes in ${STASH_NAME}:"
git stash push --keep-index --include-untracked -m $STASH_NAME

# Actually build
echo "Building: "
npm run build

echo ""
echo "Done building."

# Restore unsaved changes
echo "Attemping to restore stashed unsaved changes: popping stash ${STASH_NAME}..."
git stash pop

echo "----------- Finished pre-commit hook -----------"
