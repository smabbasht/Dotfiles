function sc --wraps=du\ -a\ /.config/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --wraps=du\ -a\ \~/.config/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim --description alias\ sc\ du\ -a\ \~/.config/\ \|\ awk\ \'\{print\ \}\'\ \|\ fzf\ \|\ xargs\ -r\ nvim
  du -a ~/.config/ | awk '{print }' | fzf | xargs -r nvim $argv
        
end
