set -U fish_greeting ""

if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

# echo "  "
# neofetch
fish_add_path ~/swift-n

set -gx SUCCESS_SYMBOL "🐟"

#set randNum (random 1 1 104)
##echo $randNum
#
#function quote
  ## Set the file path to the quotes file
  #set quote_file $HOME/.config/quotes/quotes.txt
  ## Retrieve a random quote for the file
  #sed -n $(awk "END{ print $randNum }" $quote_file)p $quote_file
#end
#
## This function builds your prompt. It is called below:
#function prompt
  ## Call the quote function inside your prompt function and it prints a quote to your terminal
  #quote
  ## Here is where we actually export the PS1 variable which stores the text for your prompt
  #export PS1
#end
#
## Call the prompt function
## prompt

# set export $(dbus-launch)
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path ~/Desktop/packages/source/tmux/
# eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# bash ~/.config/scripts/remind.sh
fish_add_path ~/.config/scripts
# bash ~/.config/scripts/n.sh
function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm use 17.9.0 --silent

#
# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

# Vim Mode
fish_vi_key_bindings

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f /opt/miniconda3/bin/conda
#     eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/opt/miniconda3/bin" $PATH
#     end
# end
# # <<< conda initialize <<<
