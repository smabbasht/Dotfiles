#!/usr/bin/env bash

du -a ~/ | awk '{print }' | fzf | xargs -r nvim $argv
