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
sudo pacman -S neovim tmux starship rofi zoxide fzf polybar feh noto-fonts-emoji thunar unzip moreutils flameshot parcellite xclip bat exa man neofetch lazygit --noconfirm
yay -S picom-jonaburg-git --noconfirm

# install other tiny packages
sudo pacman -S python-pygments imagemagick libcanberra python-pynvim libnotify archlinux-keyring libsecret xorg-xbacklight icat --noconfirm
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

# Configure sugar-dark theme
sudo sed -i 's/Current=.*/Current=sugar-dark/g' /usr/lib/sddm/sddm.conf.d/default.conf
# Change Background in theme.conf
# sudo sed -i 's/Background=.*/Background=\"~\/.config\/images\/login*\"/g' /usr/share/sddm/themes/sugar-dark/theme.conf
sudo mv ~/.config/images/login-screen-wall.jpg /usr/share/sddm/themes/sugar-dark/Background.jpg
# font.capitalization: Font.Capitalize in Components/inputs.qml
sudo sed -i '/font.capitalization: Font.Capitalize/d' /usr/share/sddm/themes/sugar-dark/Components/Input.qml
# ForceHideCompletePassword == "true" in theme.conf using sed
sudo sed -i 's/ForceHideCompletePassword=.*/ForceHideCompletePassword=true/g' /usr/share/sddm/themes/sugar-dark/theme.conf


# Configure i3 Touchpad through awk and find where it is written Identifier "libinput touchpad catchall"; configure it for scrolling method, natural scrolling, tapping on, tapping button map
sudo awk '/Identifier "libinput touchpad catchall"/{print;print "        Option \"ScrollMethod\" \"twofinger\"";print "        Option \"NaturalScrolling\" \"true\"";print "        Option \"Tapping\" \"on\"";print "        Option \"TappingButtonMap\" \"lrm\"";next}1' /usr/share/X11/xorg.conf.d/40-libinput.conf > tmp && sudo mv tmp /usr/share/X11/xorg.conf.d/40-libinput.conf

# Install lxappearance to set themes
sudo pacman -S lxappearance --noconfirm

# Enable Network Manager
sudo systemctl enable NetworkManager

# Install Nerd Fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip"
mkdir -p ~/.local/share/fonts/
mv ./Hack.zip ~/.local/share/fonts/Hack.zip
cd ~/.local/share/fonts
unzip Hack.zip
rm -rvf Hack.zip

# Installing themes
yay -S orchis-theme reversal-icon-theme-git breeze-default-cursor-theme --noconfirm


# Add the blazingly fast n
cd
git clone https://github.com/smabbasht/swift-n
cd swift-n
# update fish.config with adding this  in that somewhere "fish_add_path ~/swift-n" using awk or sed 
awk '/neofetch/{print;print "fish_add_path ~/swift-n";next}1' ~/.config/fish/config.fish > tmp && mv tmp ~/.config/fish/config.fish

# change shell to fish 
chsh -s /usr/bin/fish

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

