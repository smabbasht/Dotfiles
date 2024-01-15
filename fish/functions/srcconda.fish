function srcconda --wraps='eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source' --description 'alias srcconda eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source'
  eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source $argv
        
end
