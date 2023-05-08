function fch --wraps='feh --bg-fill --randomize ~/.config/Backgrounds/current-backgrounds/*' --wraps='feh --bg-fill --randomize ~/.config/Backgrounds/*' --description 'alias fch feh --bg-fill --randomize ~/.config/Backgrounds/*'
  feh --bg-fill --randomize ~/.config/Backgrounds/* $argv
        
end
