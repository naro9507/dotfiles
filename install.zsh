#!/bin/zsh

dir=$(cd $(dirname $0) && pwd)

function create_homedir_symlink() {
  local basepath=$dir/$1
  if [ -z $basepath ]; then
    return
  fi

  # 第２引数で出力ファイル名変更可能
  local outname=$2
  if [ -z $outname ]; then
    local outname=$1
  fi

  local outpath=~/$outname
  if [ -e $outpath ]; then
    return
  fi

  ln -sfv $basepath $outpath
}

files=(
  .gitconfig
  .gitconfig_global
  .gitignore
  .gitignore_global
  .zshrc
  .zshenv
  .czrc
  aliases.zsh
  zplug.zsh
  functions.zsh
)

# zsh sym link files
if [[ $SHELL = "/bin/zsh" ]]; then
  for file in ${files[@]}; do
    create_homedir_symlink ${file}
  done
else
  echo 'This dotfiles use Zsh only.'
  exit 0
fi

pwd=$(pwd)
# symbolic link for vscode settings.json
ln -sfv ${pwd}/setting/vscode/settings.json ${HOME}/Library/Application\ Support/Code/User/settings.json

# command
for file in $(\find $pwd/install -name \*.zsh); do
  echo $file
done

# install tools
for file in $(\find $pwd/install -name \*.zsh); do
  $file
  echo "$(\basename $file .zsh) setup is complete!"
done

# setup setting
./setting/setup.zsh

echo "installed!"

