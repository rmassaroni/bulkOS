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
