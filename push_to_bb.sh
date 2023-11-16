#!/bin/bash
REPO_NAME=temp2
GIT_REPO=https://github.com/Aggerest/$REPO_NAME.git

echo Start
cd -P "$REPO_NAME"
echo $(pwd)
git remote add bitbucket $GIT_REPO
GIT_SSL_NO_VERIFY=true git push --all --force bitbucket
GIT_SSL_NO_VERIFY=true git push --tags --force bitbucket
git remote remove bitbucket
echo Finish

read -p "Press any key to continue..."
