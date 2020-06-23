#!/bin/sh

# Usage: ln -s git_hooks/pre-commit.sh .git/hooks/pre-commit

# Stash unsaved changes before running script body 
# (derived from: https://codeinthehole.com/tips/tips-for-using-a-git-pre-commit-hook/)
STASH_NAME="pre-commit-$(date +%s)"
echo "----------- Running pre-commit hook -----------"
echo "Stashing unsaved changes in ${STASH_NAME}"
git stash save -q --keep-index $STASH_NAME

# Actually build
echo ""
echo "Building: "
npm run build

echo ""
echo "Done building."

# Restore unsaved changes
echo "Attemping to restore shashed unsaved changes..."
STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
    git stash pop -q
    echo "Successful!"
else
    echo "Failed."
fi

echo "----------- Finished pre-commit hook -----------"
