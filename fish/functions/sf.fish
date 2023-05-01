function sf --wraps=du\ -a\ \~/\ \|\ awk\ \'\(print\ \)\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --wraps=du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --description alias\ sf\ du\ -a\ \~/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim
  du -a ~/ | awk '{print }' | fzf | xargs -r nvim $argv
        
end
