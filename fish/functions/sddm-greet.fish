function sddm-greet --wraps='sddm-greeter --test-mode --theme /usr/share/sddm/themes/sugar-dark/' --description 'alias sddm-greet sddm-greeter --test-mode --theme /usr/share/sddm/themes/sugar-dark/'
  sddm-greeter --test-mode --theme /usr/share/sddm/themes/sugar-dark/ $argv
        
end
