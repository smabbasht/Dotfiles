function sd --wraps=du\ -a\ \~/Desktop/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --description alias\ sd\ du\ -a\ \~/Desktop/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim
  du -a ~/Desktop/ | awk '{print }' | fzf | xargs -r nvim $argv
        
end
