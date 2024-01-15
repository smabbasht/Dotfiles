function hostname --wraps=hostnamectl\ \|\ grep\ archmate\ \|\ awk\ \'\{print\ \}\' --description alias\ hostname\ hostnamectl\ \|\ grep\ archmate\ \|\ awk\ \'\{print\ \}\'
  hostnamectl | grep archmate | awk '{print }' $argv
        
end
