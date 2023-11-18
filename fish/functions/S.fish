function S --wraps='sudo apt show' --wraps='sudo pacman --noconfirm -S' --description 'alias S sudo pacman --noconfirm -S'
  sudo pacman --noconfirm -S $argv
        
end
