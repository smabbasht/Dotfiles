function syu --wraps='sudo pacman -Syu --no-confirm' --wraps='sudo pacman -Syu --noconfirm' --description 'alias syu sudo pacman -Syu --noconfirm'
  sudo pacman -Syu --noconfirm $argv
        
end
