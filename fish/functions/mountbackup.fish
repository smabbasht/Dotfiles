function mountbackup --wraps='sudo ntfs-3g /dev/sdb3 /run/media/smabbasht/Backup' --wraps='sudo ntfs-3g /dev/sdb1 /run/media/smabbasht/Ubuntu' --description 'alias mountbackup sudo ntfs-3g /dev/sdb1 /run/media/smabbasht/Ubuntu'
  sudo ntfs-3g /dev/sdb1 /run/media/smabbasht/Ubuntu $argv
        
end
