function R --wraps='sudo pacman -Rns' --wraps='sudo apt remove' --description 'alias R sudo apt remove'
  sudo apt remove $argv
        
end
