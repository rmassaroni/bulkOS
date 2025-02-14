Run the following in a zsh shell for dotfiles, zap-zsh, and [gpush](https://github.com/rmassaroni/gpush). May be used for updating.

```bash
bash <(curl https://raw.githubusercontent.com/rmassaroni/bulkOS/main/install.sh);
source $HOME/.zshrc
```

> [!NOTE]
> If the user is not already in zsh, it will change the shell to zsh, and the user will need to log out and back in to see changes.


# Install Everything:
Requires zsh

Includes dotfiles, Zap plugins, Homebrew, and [my Neovim config](https://github.com/rmassaroni/rjvim).
```bash
bash <(curl https://raw.githubusercontent.com/rmassaroni/bulkOS/main/install.sh); 
bash <(curl https://raw.githubusercontent.com/rmassaroni/rjvim/main/install.sh); 
source $HOME/.zshrc
```

Might just include rjvim curl inside install.sh


## TODO:
- make new install scripts!
- automate git auth.  git config --global credential.helper store
- install script needs to have separate steps if computer is ARM. homebrew will not work on arm
- still need to check surface book's settings/json
- look into alacraty, tmux
- include wsl specific setup
- will eventually need .gconfig from old bulkOS
- bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh)
- put an extenstion on .aliases for neatness
- find the original .bashrc
- .profile and other files from old/
- apt isnt universal
- linux distro specific scripts
- files like .scripts.sh do not need to be in the home directory. .scripts.sh also probably doesn't need to be hidden
- instead of printing all files not found on startup, print '3 files not found. enter some command for details'
- script dir?
- install homebrew on non-arm systems: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
- specify requirements
- dotfiles status script that prints symlink status and prints relavent information such as OS and architecture
- verify safe updating
- add a zsh prompt attribute that shows if in external drive
- put a comment on top of each file that shows their actual location
- stow: installation from source:
- git clone https://git.savannah.gnu.org/git/stow.git
- cd stow
- sudo make install



### zsh setup
- sudo apt install zsh
- zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
- chsh -s $(which zsh)
- if the .p10k.zsh does not already exist, it will force the config setup. add the file beforehand






