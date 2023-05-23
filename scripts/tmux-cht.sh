#!/usr/bin/env bash
selected=`cat ~/.config/chtsh/languages ~/.config/chtsh/commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux new-window -h bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 5; done"
else
    query=`echo $query | tr ' ' '+'`
    tmux new-window split -h bash -c "curl -s cht.sh/$selected~$query | less"
fi

