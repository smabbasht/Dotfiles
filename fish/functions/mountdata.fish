function mountdata --wraps='sudo mount /dev/sdb3 /run/media/Data' --description 'alias mountdata sudo mount /dev/sdb3 /run/media/Data'
  sudo mount /dev/sdb3 /run/media/Data $argv
        
end
