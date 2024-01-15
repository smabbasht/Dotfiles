function mountData --wraps='sudo mount /dev/sdb3 /run/media/Data' --description 'alias mountData sudo mount /dev/sdb3 /run/media/Data'
  sudo mount /dev/sdb3 /run/media/Data $argv
        
end
