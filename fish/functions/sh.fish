function sh --wraps=du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --wraps='history | fzf' --description 'alias sh history | fzf'
  history | fzf $argv
        
end
