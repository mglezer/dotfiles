#! /bin/bash

for dotfile in $(git ls-files); do
  echo "linking file $dotfile"
  if [ $dotfile:0:1 == '.' ]
    then
      ln -s $dotfile ~/$dotfile
  fi
done
