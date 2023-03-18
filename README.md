


### Screenshots

| | |
|:-------------------------:|:-------------------------:|
|<img width="1604" alt="desktop" src="./images/1_desktop.png"> |  <img width="1604" alt="b_top, neofetch, tmux" src="./images/2_btop.png">|
|<img width="1604" alt="display-manager" src="./images/3_dm.png">  |  <img width="1604" alt="rofi launcher" src="./images/4_rofi.png">|

This is a repository I maintain for my personal use, in order to keep track of my dotfiles. It is super useful when I
have to setup my tools on a new machine or in case I mess around with my OS (I use Arch btw! XD) and things get serious. <br>
I have curated a neat UI with natural keybindings and aliases for my daily workflow tools that are listed below <br>
If you want to setup your .config files for the tools mentioned below, you could give these files a try for a minimal and productive setup.

I run Vanilla Arch Linux with:

*   i3 - tiling window manager
*   sddm - display manager (login manager)
*   neovim - best code and text editor out there
*   fish - shell
*   kitty - terminal emulator
*   tmux - terminal multiplexer
*   starship - shell prompt
*   rofi - applicating launcher
*   polybar - status bar client

> All config files and folders are for Linux and I haven't tested them for windows, macOS or other proprietary operating
> systems so please edit the OS specific sections if you desire to use these on them.

### Installation Scripts

#### Arch Linux

For Arch Based Distributions, the attached command will install all the dependencies

    sudo pacman -S neovim tmux kitty fish sddm starship rofi polybar i3 \
            scrot feh picom noto-fonts-emoji notify --noconfirm i3lock-color i3lock-fancy-git 

There are some key bindings in i3 configuration file such as for `brave-browser`, `thunar`, `mailspring` etc. If you don't wish to use them then comment corresponding lines
from `line 68` to `line 83` in `i3/config` file so that i3 launches with no error. same goes if you are planning not to use `kitty` or `rofi` etc. 
> Note that if you don't comment the lines where any of the software that you don't have on the system is referenced, i3 will not launch properly and show error.

If you wish to use these nice opensource software, then install them through `pacman` and `yay` using the command added below

    sudo pacman -S yay thunar 
    yay -S brave mailspring

This repository can be cloned into your `~/.config/` folder through this command:
```
git clone https://github.com/smabbasht/dotfiles.git ~/.config
mv ~/.config/dotfiles/* ~/.config/
mv ~/.config/dotfiles/.* ~/.config/
```

### Considerations

#### Tmux

*   .tmux.conf should be in your home folder, the path should be `~/.tmux.conf`, I know you can force source other
    locations but that appeared to be inconsistent to me and I have to do it repeatedly, therefore it's good to put it there, I have
    made a hard link of the two files so both the locations essentially point to the same file.

#### Neovim

*   Neovim version must be atleast 0.7 so the the version 'apt' ships on Ubuntu may not be able to run the configurations.
    On Ubuntu or other Debian based distros you could alternatively install Neovim through ppa with these commands <br>

<!---->

    sudo apt-get install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim

*   For the Github copilot to run on neovim, it requires node version to be below 18 and above 16, I use it with v17.9.0 and it works
    like a charm, you can downgrade or upgrade your node version by running the commands below, nodejs and npm is required, which can
    be installed with pacman, dnf, apt etc. based on your OS and distro.

<!---->

    sudo pacman -S nodejs npm

you should replace pacman with your package manager eg. apt, dnf, rpm etc.

    npm install -g n
    n 17.9.0

*   When you will first open Neovim it might give you some error, just ignore by pressing enter to get the default look of neovim,
    once you do this, type `:PackerSync` in normal mode to get all the packages installed, once it's done, quit the neovim and
    relaunch it, it will start configuring some other stuff you can see that in lualine, once it's done (probably takes a minute or two)
    you could now use your neovim as normal.
*   For getting language support, format features and intellisense for languages you use, use Mason, you can lanch it by typing `:Mason`
    in normal mode, press Ctrl-F and see the number of your desired language by navigating through space and enter that number in the dialog
    below the list of languages (go there by pressing space multiple times), it will shortlist the packages for your language navigate to
    your desired package and press I to install, X to uninstall and U to update, press Esc to get to default Mason screen, you can now go
    setup the environment for your next language if you wish to.

#### SDDM 

*   SDDM has a few config file locations you can edit any of them to setup theme and do other customizations; typical locations are `/usr/lib/sddm/sddm.conf.d/default.conf`, `/etc/sddm.conf.d`.
*   SDDM themes live here: `/usr/share/sddm/themes/`, If you wish to use any theme you can either download it from `AUR` or use `yay` to install it if you're on arch 
or you could do it manually as described [here](https://store.kde.org/p/1312658) 
*   Themes can be modified by editing `/usr/share/sddm/themes/theme-name/theme.conf`, 
*   I use `sugar-dark` as my sddm theme. `sugar-candy` is also a good option. 
*   Common modifications to theme could be: <br>
    * Changing the background which could be done by editing `theme.conf`,where  you could add this path as your background image if you have cloned this repository in your `~/.config`: `~/.config/images/login*`
    * Disabling *1s* peek for password letters while entering
      for this, you need to set `config.ForceHideCompletePassword == "true"` in `Components/Input.qml`
    * Forcing the first letter of username to be lowercase as usernames aren't meant be Capitalized, 
      for this, you need to comment out `font.capitalization: Font.Capitalize` in `Components/Input.qml`

#### Fish

* `fish/config.fish` uses `~/shell_quotes_prompt/quotes.txt`, that you may have to create yourself if you wish to use the tweak, Basically it 
displays a random quotation in the file `quotes.txt` and displays everytime you launch your shell which I found prolific. If you wish to ignore
it, remove `line 10` to `line 33`.
* It also uses [zoxide](https://github.com/ajeetdsouza/zoxide) which is a nice replacement to cd, if you wish not to use that remove the corresponding two lines.
* It also uses [fish_vi_key_bindings](https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_vi_key_bindings.fish) which is gives vi-key-bindings in fish shell, if you wish not to use that remove the corresponding two ines.

### Other Configurations

Here I have listed other productivity configurations aside from the `.config` folder <br>

#### i3

*   In i3, enable *Natural Scrolling* and *Tap to click* by adding the lines with Option keyword in the snippet below, it would look something like this;

<!---->

    Section "InputClass"
            Identifier "touchpad"
            MatchIsTouchpad "on"
            Driver "libinput"
            Option "Tapping" "on"
            Option "TappingButtonMap" "lrm"
            Option "NaturalScrolling" "on"
            Option "ScrollMethod" "twofinger"
    EndSection

This should be the touchpad or mouse (as per the device you desire to have natural scroling with) section in `/usr/share/X11/xorg.conf.d/40-libinput.conf` file.

*   To install themes in i3, you could use a nice utility `lxappearance`, install the desired theme to system with the relevant instructions provided by the theme distributors and then launch lxappearance and select from the list of installed themes. lxappearance is lightweight and is available in arch official repository and should also be installable with apt, dnf, rpm etc.

*   I have also configured `i3lock-color` which is a fork of `i3lock`, there is a script for nice and decent lock in `i3/lock.sh`, I usually prefer to put an alias to `bash ~/.config/i3/lcok.sh && systemctl suspend` so that I could suspend with a nice lockscreen blazingly fast.

### Packages Used

*   i3
*   neovim
*   sddm
*   fish
*   kitty
*   tmux
*   starship
*   rofi
*   polybar
*   scrot
*   feh
*   picom
*   i3lock-color
*   i3lock-fancy-git
*   notify
*   Any Nerd Font, I use `Hack Nerd Font` which is pretty nice,

> You can install any *nerd font* through their official [distributor website](https://www.nerdfonts.com/) and unzip the file in `~/.local/share/fonts/`
> If you wish to use `Hack Nerd Font` then just do this:

    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip"
    mkdir -p ~/.local/share/fonts/
    mv ./Hack.zip ~/.local/share/fonts/Hack.zip
    cd ~/.local/share/fonts
    unzip Hack.zip
    rm -rvf Hack.zip

#### [Optional Packages]

*   yay
*   thunar
*   brave
*   mailspring
*   whatsapp-for-linux

> If you wish not to use software listed in optional packages,
> please edit the `config/i3` accordingly to avoid any errors (you should then comment the corresponding lines as described above).

<!-- ### File Structure -->
<!---->
<!-- .config <br> -->
<!---->
<!-- ├── i3 <br> -->
<!-- │   └── config <br> -->
<!-- ├── nvim <br> -->
<!-- │   ├── init.lua <br> -->
<!-- │   └── plugin <br> -->
<!-- │       └── packer\_compiled.lua <br> -->
<!-- ├── polybar <br> -->
<!-- │   ├── config.ini <br> -->
<!-- │   └── launch.sh <br> -->
<!-- ├── README.md <br> -->
<!-- ├── rofi <br> -->
<!-- │   ├── config.rasi <br> -->
<!-- │   └── themes <br> -->
<!-- │       └── dt-center.rasi <br> -->
<!-- ├── tmux <br> -->
<!-- ├── .tmux.conf <br> -->
<!-- ├── starship.toml <br> -->
<!-- ├── kitty <br> -->
<!-- │   └── kitty.conf <br> -->
<!-- ├── fish <br> -->
<!-- │   ├── completions <br> -->
<!-- │   ├── conf.d <br> -->
<!-- │   │   └── dracula.fish <br> -->
<!-- │   ├── config.fish <br> -->
<!-- │   ├── config.fish.bak <br> -->
<!-- │   ├── fish\_variables <br> -->
<!-- │   └── functions <br> -->
<!-- │       ├── amake.fish <br> -->
<!-- │       ├── battery.fish <br> -->
<!-- │       ├── con.fish <br> -->
<!-- │       ├── e.fish <br> -->
<!-- │       ├── gtop.fish <br> -->
<!-- │       ├── Q.fish <br> -->
<!-- │       ├── qp.fish <br> -->
<!-- │       ├── qr.fish <br> -->
<!-- │       ├── qs.fish <br> -->
<!-- │       ├── R.fish <br> -->
<!-- │       ├── S.fish <br> -->
<!-- │       └── tmls.fish <br> -->
<!-- ├── clang-format <br> -->
<!-- │   └── .clang-format <br> -->
<!-- └── latex <br> -->
<!--    └── template.tex <br> <br> -->
<!---->
<!-- > Note: some fish functions aren't included due to irrelevance -->

### Credits

Some parts of my dotfiles are inspired by opensource content creators and contributors:

* `nvim/init.lua` follows the base template of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) by [TJ DeVries](https://www.youtube.com/@teej_dv)
* A few keymaps in `nvim/init.lua` are inspired by [ThePrimeagen](https://www.youtube.com/c/theprimeagen)
* Credits for the theming of `rofi` belongs to [DistroTube](https://www.youtube.com/c/distrotube) published on his [GitLab](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/rofi)
* `clang-format/` and `latex/` are contributed by [Qazalbash](www.github.com/Qazalbash)
* `i3` customization is inspired by [The Linux Cast](https://www.youtube.com/c/TheLinuxCast?app=desktop) videos.
* Plus some nice guys on [StackOverflow](www.stackoverflow.com), [Archwiki](https://wiki.archlinux.org/), [Reddit](www.reddit.com), [GitHub](www.github.com), [Youtube](www.youtube.com) etc who I may have forgotten to include.

#### Cheers
