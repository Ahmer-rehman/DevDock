#!/bin/bash

# Navigate to the repository directory (if needed)
# cd /path/to/your/repo

# Check for changes
if [[ `git status --porcelain` ]]; then
  # Stage all changes
  git add -A

  # Commit changes with a timestamp
  git commit -m "Auto commit on $(date +'%Y-%m-%d %H:%M:%S')"

  # Push changes to the repository
  git push origin main
else
  echo "No changes to commit."
fi
