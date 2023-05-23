#!/usr/bin/env bash

# I want to write a script that uses fzf to search for directories and navigate to selected directory which I'll use in my terminal to navigae quickly 
cd $(find . -type d | fzf)
# find ~ -type d | fzf | xargs -I {} cd {} 
# cd $dir
# echo $dir


