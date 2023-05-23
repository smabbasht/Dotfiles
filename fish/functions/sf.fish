function sf --wraps=du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim\ \$argv --description alias\ sf\ du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim\ \$argv
  du -a ~/ | awk '{print }' | fzf | xargs -r nvim $argv $argv
        
end
