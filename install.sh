#! /bin/bash

for dotfile in $(git ls-files); do
  if [ ${dotfile:0:1} == '.' ]
    then
      echo "installing $dotfile"
      ln -s $(pwd)/$dotfile ~/$dotfile
  fi
done

echo "installing lint tools"
#javascript
sudo npm install -g eslint
sudo npm install -g eslint_d
sudo npm install -g jsonlint
sudo npm install -g eslint-plugin-react
sudo npm install -g babel-eslint
#yaml
sudo npm install -g js-yaml

echo "setting global .gitignore"
git config --global core.excludesfile ~/.gitignore_global

echo "setting up git"
git config --global user.email "mathan.glezer@gmail.com"
git config --global user.name "Mathan Glezer"
git config --global color.ui auto
git config --global color.branch auto
git config --global color.status auto
git config --global push.default simple
git config --global core.editor "vim"

echo "setting up vundle for vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
