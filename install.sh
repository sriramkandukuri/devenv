devdir=$PWD

if [ "$devdir" != "$HOME/devenv" ]
then
    echo "Please install from ~/devenv"
    exit -1
fi

rm -rf build
mkdir build
cd build

builddir=$devdir/build

install_tools ()
{
    sudo apt-get -yq update
    sudo apt-get -yq upgrade
    sudo apt-get -yq install cscope
    sudo apt-get -yq install ctags
    sudo apt-get -yq install python
    sudo apt-get -yq install python-pip
    sudo apt-get -yq install python3
    sudo apt-get -yq install python-pip
    sudo apt-get -yq install snapd
}

install_ripgrep ()
{
    rg -V| grep '^ripgrep 11'
    if [ "$?" == "0"]
    then
        return;
    fi
    mkdir $builddir/rg
    cd $builddir/rg
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
    sudo dpkg -i ripgrep_11.0.2_amd64.deb
}

# install tmux
install_tmux ()
{
    tmux -V| grep '^tmux 3.1'
    if [ "$?" == "0"]
    then
        return;
    fi
    mkdir $builddir/tmux
    cd $builddir/tmux
    curl -LO https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz
    tar -xf tmux-3.1.tar.gz
    cd tmux-3.1
    ./configure && make >> install.log 2>&1
    sudo make install >> install.log 2>&1
    cd $builddir
}

# install tmux conf
install_tmux_conf ()
{
    mkdir $builddir/tmuxconf
    cd $builddir/tmuxconf
    git clone https://github.com/gpakosz/.tmux.git
    unlink ~/.tmux.conf.local
    unlink ~/.tmux.conf
    unlink ~/.mytmux.conf
    ln -s -f $PWD/.tmux/.tmux.conf ~/
    ln -s -f $PWD/.tmux/.tmux.conf.local ~/
    ln -s -f $devdir/mytmux.conf ~/.mytmux.conf
    echo "source-file ~/.mytmux.conf" >> ~/.tmux.conf.local
    cd $builddir
}

# install bashrc
install_bashrc ()
{
    echo "Add '. ~/devenv/bashrc'  to ~/.bashrc"
}

install_clangd_notusing ()
{
    # 10
    mkdir $builddir/clangd
    cd $builddir/clangd
    curl -LO https://github.com/clangd/clangd/releases/download/10rc3/clangd-linux-10rc3.zip
    unzip -q clangd-linux-10rc3.zip
    sudo cp clangd_10rc3/bin/* /usr/local/bin/
    sudo cp clangd_10rc3/lib/* /usr/local/lib/
    curl -LO https://github.com/llvm/llvm-project/releases/download/llvmorg-9.0.1/clang+llvm-9.0.1-powerpc64le-linux-ubuntu-16.04.tar.xz
}

install_nvim ()
{
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get -yq update
    sudo apt-get -yq install neovim
}

install_vim ()
{
    sudo add-apt-repository -yq ppa:jonathonf/vim
    sudo apt update
    sudo apt install vim
}

# get vimrc and install plugins
install_vimrc ()
{
    mkdir $builddir/vimrc
    cd $builddir/vimrc
    unlink ~/.vimrc
    ln -s $devdir/myvimrc ~/.vimrc

    # Install vim plug plugin manager
    ## remove already installed .vim directory
    unlink ~/.vim
    rm -rf ~/.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
    cd ~/.vim/plugged/YouCompleteMe/
    ./install.sh --clangd-completer --clang-completer > /dev/null 2>&1
    ln -s -f $devdir/coc.vimrc ~/.cocvrc
    ln -s -f $devdir/coc-settings.json ~/.vim/
    mkdir ~/.vim/undodir
}

install_node ()
{
    sudo apt-get -yq update
    sudo apt-get -yq install nodejs
    sudo apt-get -yq install npm
}

case $1 in
    all)
        install_tools
#        install_clangd
        install_node
        install_bashrc
        install_tmux
        install_tmux_conf
#        install_nvim
        install_vim
        install_vimrc
        install_ripgrep
        ;;
    *)
        install_$1
        ;;
esac

