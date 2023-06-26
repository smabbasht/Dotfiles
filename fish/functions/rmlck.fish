function rmlck --wraps='sudo rm -rvf /var/lib/pacman/db.lck' --description 'alias rmlck sudo rm -rvf /var/lib/pacman/db.lck'
  sudo rm -rvf /var/lib/pacman/db.lck $argv
        
end
