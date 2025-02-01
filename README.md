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



automate git auth



-- still need to check surface book's settings/json


-- look into alacraty, tmux

-- auth setup
-- git config --global credential.helper store


--include wsl setup



-- zsh setup
-- sudo apt install zsh
-- zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
-- chsh -s $(which zsh)

-- if the .p10k.zsh does not already exist, it will force the config setup. add the file beforehand


- will eventually need .gconfig from old bulkOS
- bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh)


- put an extenstion on .aliases for neatness
