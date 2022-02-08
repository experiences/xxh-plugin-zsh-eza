#!/usr/bin/env bash

# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
plugin_name='xxh-plugin-zsh-exa'

export PATH=$CURR_DIR/bin:$PATH
# source $CURR_DIR/completions/exa.zsh
fpath=($CURR_DIR/completions $fpath)
# cp $CURR_DIR/completions/exa.zsh $CURR_DIR/../../xxh-plugin-zsh-ohmyzsh/build/ohmyzsh/plugins/zsh-completions/src/_exa
# autoload -U compinit && compinit