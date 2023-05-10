function R --wraps='sudo pacman -Rs' --description 'alias R sudo pacman -Rs'
  sudo pacman -Rs $argv
        
end
