#! /bin/sh
set -e

make_directory_structure()
{
    # Default value of XDG_CONFIG_HOME is $HOME/.config
    mkdir -p ~/.config

    # Default value of XDG_DATA_HOME is $HOME/.local/share
    mkdir -p ~/.local/share

    # Undodir
    mkdir -p ~/.local/share/nvim/undodir

    # Autoload directory for vim-plug
    mkdir -p ~/.local/share/nvim/site/autoload
    
    # Plugged directory for what vim-plug installs
    mkdir -p ~/.local/share/nvim/site/plugged
    
}

make_symlinks()
{
    # Explicitly removing the directory (ovekill due to ln -sf)
    rm -rf ~/.config/nvim
    ln -sf $(pwd) ~/.config
}

latest_vim_plug()
{
    curl --silent -fLo ~/.local/share/nvim/site/autoload/plug.vim \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

lastest_plugins()
{
    nvim --headless +PlugInstall +PlugUpdate +qall
}

lastest_lsp_servers(){
    npm install -g pyright &> /dev/null
    npm install -g bash-language-server &> /dev/null
}

latest()
{
   make_directory_structure
   make_symlinks
   latest_vim_plug
   lastest_plugins
   lastest_lsp_servers
}
