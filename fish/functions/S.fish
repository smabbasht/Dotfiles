function S --wraps='sudo pacman -S' --wraps='sudo pacman -S --noconfirm' --description 'alias S sudo pacman -S --noconfirm'
  sudo pacman -S --noconfirm $argv
        
end
