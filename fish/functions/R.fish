function R --wraps='sudo pacman -Rns' --description 'alias R sudo pacman -Rns'
  sudo pacman -Rns $argv
        
end
