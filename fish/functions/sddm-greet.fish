function sddm-greet --wraps='sddm-greeter --test-mode --theme /usr/share/sddm/themes/sugar*' --description 'alias sddm-greet sddm-greeter --test-mode --theme /usr/share/sddm/themes/sugar*'
  sddm-greeter --test-mode --theme /usr/share/sddm/themes/sugar* $argv
        
end
