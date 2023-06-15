set -U fish_greeting ""

if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

echo "  "
# neofetch

set -gx SUCCESS_SYMBOL "🐟"

set randNum (random 1 1 104)
#echo $randNum

function quote
  # Set the file path to the quotes file
  set quote_file $HOME/.config/quotes/quotes.txt
  # Retrieve a random quote for the file
  sed -n $(awk "END{ print $randNum }" $quote_file)p $quote_file
end

# This function builds your prompt. It is called below:
function prompt
  # Call the quote function inside your prompt function and it prints a quote to your terminal
  quote
  # Here is where we actually export the PS1 variable which stores the text for your prompt
  export PS1
end

# Call the prompt function
# prompt

export $(dbus-launch)
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# bash ~/.config/scripts/remind.sh
fish_add_path ~/.config/scripts
# bash ~/.config/scripts/n.sh

#
# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

# Vim Mode
fish_vi_key_bindings
