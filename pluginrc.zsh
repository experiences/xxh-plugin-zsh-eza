#!/usr/bin/env bash

# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
plugin_name='xxh-plugin-zsh-exa'

export PATH=$CURR_DIR/bin:$PATH
fpath=($CURR_DIR/completions $fpath)
# alias ls='exa -g --group-directories-first --time-style=long-iso --icons'