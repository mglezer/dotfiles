#! /bin/bash

for dotfile in $(git ls-files); do
  if [ ${dotfile:0:1} == '.' ]
    then
      echo "installing $dotfile"
      ln -s $(pwd)/$dotfile ~/$dotfile
  fi
done
