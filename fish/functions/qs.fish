function qs --wraps='i3lock-fancy && systemctl suspend' --description 'alias qs i3lock-fancy && systemctl suspend'
  i3lock-fancy && systemctl suspend $argv
        
end
