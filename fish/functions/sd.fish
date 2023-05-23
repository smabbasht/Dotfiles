function sd --wraps='cd $(fd -H ~ -type d | fzf)' --wraps='cd $(fd -H ~ --type directory | fzf)' --wraps='cd $(fd . -H --type directory | fzf)' --description 'alias sd cd $(fd . -H --type directory | fzf)'
  cd $(fd . -H --type directory | fzf) $argv
        
end
