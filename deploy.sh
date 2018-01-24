#!/bin/bash

cd `dirname $0`

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Go To Public folder
cd docs

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git branch tmp
git checkout master
git merge tmp
git push origin master
git branch -d tmp

# show status
git status

# Come Back up to the Project Root
cd ..
