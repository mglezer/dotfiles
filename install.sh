#! /bin/bash

for dotfile in $(git ls-files); do
  if [ ${dotfile:0:1} == '.' ]
    then
      echo "installing $dotfile"
      ln -s $(pwd)/$dotfile ~/$dotfile
  fi
done

echo "installing lint tools"
sudo npm install -g eslint
sudo npm install -g eslint_d
sudo npm install -g jsonlint

echo "setting global .gitignore"
git config --global core.excludesfile ~/.gitignore_global
