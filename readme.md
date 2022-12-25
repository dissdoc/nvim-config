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
    ????
    ```
- install fzf libraries
    ```sh
    ????
    ```
4. After preinstall, then install all plugins
```sh
:PackerSync
```
5. Install any languages for TreeSitter
```sh
TSInstall any_lang
```
