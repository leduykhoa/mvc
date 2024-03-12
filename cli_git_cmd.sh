#!/bin/bash
echo "Bash version ${BASH_VERSION}..."

# ./cli_git_cmd.sh

git init
git add .
git commit -m "The First!"
git remote add bitbucket https://ottg@bitbucket.org/php_fly/mvc.git
git push bitbucket master


git remote add github https://github.com/leduykhoa/mvc.git
git push github master
