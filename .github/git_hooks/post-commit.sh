#!/bin/sh

# Usage:
#   chmod u+x .github/git_hooks/post-commit.sh
#   cd .git/hooks
#   ln -s ../../.github/git_hooks/post-commit.sh ./post-commit

git restore docs/build.css
