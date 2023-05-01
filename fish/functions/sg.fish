function sg --wraps=du\ -a\ /\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --description alias\ sg\ du\ -a\ /\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim
  du -a / | awk '{print }' | fzf | xargs -r nvim $argv
        
end
