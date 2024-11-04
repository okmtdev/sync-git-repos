#!/bin/bash

java -jar schemaspy.jar

TOKEN=$GIT_PAT

git config --global user.email "okmtdev@gmail.com"
git config --global user.name "okmtdev"
rm -rf sync-git-repos

git clone https://github.com/okmtdev/sync-git-repos.git
cd sync-git-repos

cp -r /output/* docs/

git add docs
git commit -m "update docs"
git push https://$TOKEN@github.com/okmtdev/sync-git-repos.git main