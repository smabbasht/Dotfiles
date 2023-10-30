function I --wraps='sudo apt install' --wraps='sudo apt install -y' --description 'alias I sudo apt install -y'
  sudo apt install -y $argv
        
end
