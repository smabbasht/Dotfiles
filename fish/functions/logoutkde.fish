function logoutkde --wraps='qdbus org.kde.ksmserver /KSMServer logout 1 3 3' --description 'alias logoutkde qdbus org.kde.ksmserver /KSMServer logout 1 3 3'
  qdbus org.kde.ksmserver /KSMServer logout 1 3 3 $argv
        
end
