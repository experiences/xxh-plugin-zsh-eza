#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

for f in pluginrc.zsh
do
    cp $CDIR/$f $build_dir/
done

# portable_url='https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip'
portable_url='https://github.com/eza-community/eza/releases/download/v0.17.0/eza_x86_64-unknown-linux-musl.zip'
tarname=`basename $portable_url`

cd $build_dir

[ $QUIET ] && arg_q='-q' || arg_q=''
[ $QUIET ] && arg_s='-s' || arg_s=''
[ $QUIET ] && arg_progress='' || arg_progress='--show-progress'

if [ -x "$(command -v wget)" ]; then
 wget $arg_q $arg_progress $portable_url -O $tarname
elif [ -x "$(command -v curl)" ]; then
 curl $arg_s -L $portable_url -o $tarname
else
 echo Install wget or curl
fi

unzip $tarname
# cp completions/exa.zsh completions/_eza
rm $tarname
