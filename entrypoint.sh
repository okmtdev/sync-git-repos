#!/bin/bash

TOKEN=$GIT_PAT

git config --global user.email "okmtdev@gmail.com"
git config --global user.name "okmtdev"
rm -rf sync-git-repos

git clone https://github.com/okmtdev/sync-git-repos.git
cd sync-git-repos

# ここでSSGをビルドしてhtmlを更新

git add docs
git commit -m "update docs"
git push https://$TOKEN@github.com/okmtdev/sync-git-repos.git main