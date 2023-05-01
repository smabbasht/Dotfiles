function sh --wraps=du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --description alias\ sh\ du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim
  du -a ~/ | awk '{print }' | fzf | xargs -r nvim $argv
        
end
