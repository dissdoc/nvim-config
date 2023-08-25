## Install preparing

1. Install the latest version of the NeoVim
```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```
2. Install packer
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. Install fonts optional
- install awesome fonts
    ```sh
    sudo apt install fonts-font-awesome
    ```
- install nerd fonts
    1. Download all nerd fonts from here https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack
    2. Then go to ~/.local/share/fonts
    3. After that I've created folder NerdFonts and copy to there all of my nerd-fonts
    4. And finally change language in your terminal
- install nodejs
    ```sh
    curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
    # check valid
    nano /tmp/nodesource_setup.sh
    # install nodejs
    sudo bash /tmp/nodesource_setup.sh
    sudo apt install nodejs
    # check version
    node -v
    ```
- install fzf libraries
    ```sh
    sudo apt install fzf
    ```
    After that you need install [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
4. Preinstall configs
```sh
# open current neovim directory
cd ~/.config/nvim
nvim .
# open file lua/modules/init.lua and run command
:so
# then close and open nvim again 
```
4. After preinstall, then install all plugins
```sh
:PackerSync
# you maybe need enter packer sync twise, it's not a problem? :)
:TSUpdate
```
5. Install any languages for TreeSitter
```sh
TSInstall any_lang
```
6. Add emmet module to check html
```sh
sudo npm install -g ls_emmet 
```
7. Install for Golang (for null-ls plugin)
```sh
go install github.com/incu6us/goimports-reviser/v3@latest
go install mvdan.cc/gofumpt@latest
go install github.com/segmentio/golines@latest
go install github.com/go-delve/delve/cmd/dlv@latest
```

## Commands

#### Neovim Commons

*:so* - source your neovim code

#### NVTree

*<leader>t* - toggle nvtree

*-* - directory up
*Ctrl+]* - set directory as root
*Ctrl+t* - open file in a new tab
*W* - collapse all
*E* - expand all
*f* - find smth
*F* - close find interactive search

*a* - create file or directory
*r* - rename file or directory
*d* - delete file or directory
*x* - cut file or folder
*c* - copy file or folder
*p* - paste file or folder
*y* - copy only filename to the clipboard
*o* - open file or directory

