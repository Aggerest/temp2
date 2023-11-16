#!/bin/bash
REPO_NAME=temp
TEMP_DIR=artifact
GIT_REPO=git@github.com:Aggerest/$REPO_NAME.git

echo Start
mkdir "$TEMP_DIR"
cd "$TEMP_DIR"
echo $(pwd)
git clone $GIT_REPO

echo "Fetching all branches"
cd "$REPO_NAME"
echo $(pwd)
git fetch
for a in $(git branch -r | grep origin | grep -v '>'); do git checkout --force --track "$a"; done
git checkout develop
git reset --hard

echo "Creating 7z archive"
cd ..
cd ..
echo $(pwd)
current_date=$(date +%d%m%Y)
current_time=$(date +%H%M)
tar.exe -a -c -f $REPO_NAME-${current_date}-${current_time}.7z $TEMP_DIR/$REPO_NAME

echo "Deleting temp folder"
rm -rf $TEMP_DIR
echo Finish

read -p "Press any key to resume ..."
