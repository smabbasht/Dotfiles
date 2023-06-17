# ~/.bashrc

[[ $- == *i* ]] &&
  source "$HOME/.local/share/blesh/ble.sh" --attach=none

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if [[ $- == *i* ]]; then # in interactive session
#   set -o vi
# fi

# ble.sh configurations 
ble-face region_insert='fg=252,bg=12'
ble-face region_match='bg=white,fg=55'
ble-face region_target='bg=black,fg=153'
ble-face disabled='fg=242'

# source rust 
source "$HOME/.cargo/env"

export SUCCESS_SYMBOL=""
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias e='exit'
PS1='[\u@\h \W]\$ '

# staship and zoxide
eval "$(starship init bash)"
eval "$(zoxide init bash)"

[[ ${BLE_VERSION-} ]] && ble-attach
