set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login
    set -gx PATH $PATH ~/linux/bin
end

export CHROME_EXECUTABLE=pwd

set randNum (random 1 1 129)
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
prompt

# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

# Vim Mode
fish_vi_key_bindings
