# Clone dotfiles
rm -rvf ~/.config/
mv ~/dotfiles ~/.config
cd ~/.config
git switch personal

# Installing essential packages
sudo pacman -Syu
sudo pacman -S fish kitty --noconfirm

# Installing yay
cd
sudo git clone https://aur.archlinux.org/yay-git.git
sudo chown -R $USER:$USER yay-git
cd yay-git/
makepkg -sirc --noconfirm

# Installing essential packages
yay -S brave-bin --noconfirm

# Install other packages
sudo pacman -S neovim tmux starship rofi zoxide fzf polybar feh noto-fonts-emoji thunar unzip moreutils flameshot parcellite xclip bat exa --noconfirm
yay -S picom-jonaburg-git --noconfirm

# install other tiny packages
sudo pacman -S python-pygments imagemagick libcanberra python-pynvim libnotify archlinux-keyring libsecret xorg-xbacklight --noconfirm
yay -S find-cursor i3-battery-popup --noconfirm

# Install npm of desired version (downgrade for copilot)
sudo pacman -S nodejs npm --noconfirm
sudo npm install -g n
sudo n 17.9.0

# Setting SDDM
sudo systemctl disable lightdm
sudo pacman -Rs lightdm-gtk-greeter lightdm
sudo pacman -S sddm --noconfirm
sudo systemctl enable sddm
yay -S sddm-sugar-dark --noconfirm

# Enable Network Manager
sudo systemctl enable NetworkManager

# Install Nerd Fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip"
mkdir -p ~/.local/share/fonts/
mv ./Hack.zip ~/.local/share/fonts/Hack.zip
cd ~/.local/share/fonts
unzip Hack.zip
rm -rvf Hack.zip

# Running PackerSync for Neovim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# setup tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux start-server
tmux new-session -d
tmux source ~/.config/tmux/.tmux.conf
ln ~/.config/tmux/.tmux.conf ~/.tmux.conf
bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

# Remove orphaned Packges 
sudo pacman -Qtdq | ifne sudo pacman -Rns - --noconfirm

