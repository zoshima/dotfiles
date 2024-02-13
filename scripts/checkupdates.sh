#!/bin/bash

checkupdates

cd ~/git/aur/
for dir in */; do
  pushd $dir
  git clean -f -d > /dev/null
  git fetch > /dev/null
  git status -sb 
  popd > /dev/null
done
