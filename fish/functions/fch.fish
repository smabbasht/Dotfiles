function fch --wraps='feh --bg-fill --randomize ~/.config/Backgrounds/*/*/*.jpg' --wraps='feh --bg-fill --randomize ~/.config/Backgrounds/current*' --wraps='feh --bg-fill --randomize ~/.config/Backgrounds/current*/*' --description 'alias fch feh --bg-fill --randomize ~/.config/Backgrounds/current*/*'
  feh --bg-fill --randomize ~/.config/Backgrounds/current*/* $argv
        
end
