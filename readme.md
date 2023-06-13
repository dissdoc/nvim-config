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
```
5. Install any languages for TreeSitter
```sh
TSInstall any_lang
```
6. Add special modules for the Java Module
    - Java need version 17+ (Strong!) and set JAVA_HOME
    ```sh
    export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64            
    ```
    - install or download release [microsoft/java-debug](https://github.com/microsoft/java-debug/releases/tag/0.43.0) to the /mason/packages/java-debug
    - then build the downloaded project ./mvnw clean install
