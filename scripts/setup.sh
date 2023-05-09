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
sudo chown -R smabbasht:smabbasht yay-git
cd yay-git/
makepkg -sirc

# Installing essential packages
yay -S brave-bin --noconfirm

# Install other packages
sudo pacman -S neovim tmux starship polybar rofi zoxide fzf polybar feh noto-fonts-emoji notify thunar unzip moreutils --noconfirm
yay -S picom-jonaburg-git --noconfirm

# Setting SDDM
sudo systemctl disable -gtk-greeter lightdm
sudo pacman -Rs lightdm
sudo pacman -S sddm
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

# Remove orphaned Packges 
sudo pacman -Qtdq | ifne sudo pacman -Rns - --noconfirm

