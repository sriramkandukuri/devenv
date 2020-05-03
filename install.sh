devdir=$PWD
LOGFILE=$PWD/install.log
rm -rf $LOGFILE > /dev/null 2>&1
touch $LOGFILE

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
    sudo apt-get -yq update >> $LOGFILE 2>&1 
    sudo apt-get -yq upgrade >> $LOGFILE 2>&1
    sudo apt-get -yqm install cscope ctags python python3 python3-pip \
        snapd fonts-powerline bash-completion lfm vifm libevent-dev libevent-dev \
        libncurses5-dev libncursesw5-dev cmake >> $LOGFILE 2>&1
    echo "================= Trying to install python pip for python2"
    sudo apt-get -yqm install python-pip >> $LOGFILE 2>&1
}

install_ripgrep ()
{
    rg -V| grep '^ripgrep 11'
    if [ "$?" == "0" ]
    then
        return;
    fi
    mkdir $builddir/rg
    cd $builddir/rg
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb >> $LOGFILE 2>&1
    sudo dpkg -i ripgrep_11.0.2_amd64.deb >> $LOGFILE 2>&1
}

# install tmux
install_tmux ()
{
    tmux -V| grep '^tmux 3.1'
    if [ "$?" == "0" ]
    then
        return;
    fi
    mkdir $builddir/tmux
    cd $builddir/tmux
    curl -LO https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz >> $LOGFILE 2>&1
    tar -xf tmux-3.1.tar.gz >> $LOGFILE 2>&1
    cd tmux-3.1
    ./configure >> $LOGFILE 2>&1 && make >> $LOGFILE 2>&1
    sudo make install >> $LOGFILE 2>&1
    cd $builddir
}

# install tmux conf
install_tmux_conf ()
{
    mkdir $builddir/tmuxconf
    cd $builddir/tmuxconf
    git clone https://github.com/gpakosz/.tmux.git >> $LOGFILE 2>&1
    unlink ~/.tmux.conf.local > /dev/null 2>&1
    unlink ~/.tmux.conf > /dev/null 2>&1
    unlink ~/.mytmux.conf > /dev/null 2>&1
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
    sudo add-apt-repository -y ppa:neovim-ppa/unstable >> $LOGFILE 2>&1 
    sudo apt-get -yq update  >> $LOGFILE 2>&1 
    sudo apt-get -yq install neovim >> $LOGFILE 2>&1 
}

install_vim ()
{
    sudo add-apt-repository -y ppa:jonathonf/vim >> $LOGFILE 2>&1 
    sudo apt update >> $LOGFILE 2>&1 
    sudo apt install vim >> $LOGFILE 2>&1 
}

# get vimrc and install plugins
install_vimrc ()
{
    mkdir $builddir/vimrc
    cd $builddir/vimrc
    unlink ~/.vimrc > /dev/null 2>&1
    ln -s $devdir/myvimrc ~/.vimrc > /dev/null 2>&1

    # Install vim plug plugin manager
    ## remove already installed .vim directory
    unlink ~/.vim > /dev/null 2>&1
    rm -rf ~/.vim > /dev/null 2>&1
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> $LOGFILE 2>&1 
    vim +PlugInstall +qall! >> $LOGFILE 2>&1
    cd ~/.vim/plugged/YouCompleteMe/
    ./install.py --clangd-completer --clang-completer >> $LOGFILE  2>&1
    ln -s -f $devdir/coc.vimrc ~/.cocvrc
    ln -s -f $devdir/coc-settings.json ~/.vim/
    mkdir ~/.vim/undodir
}

install_node ()
{
    sudo apt-get -yq update >> $LOGFILE 2>&1 
    sudo apt-get -yq install nodejs >> $LOGFILE 2>&1 
    sudo apt-get -yq install npm >> $LOGFILE 2>&1 
}

case $1 in
    all)
        echo "================================ installing tools"
        install_tools
        echo "================================ not installing clangd"
#        install_clangd
        echo "================================ installing node"
        install_node
        echo "================================ installing bashrc"
        install_bashrc
        echo "================================ installing tmux"
        install_tmux
        echo "================================ installing tmux_conf"
        install_tmux_conf
        echo "================================ not installing nvim"
#        install_nvim
        echo "================================ installing vim"
        install_vim
        echo "================================ installing ripgrep"
        install_ripgrep
        echo "================================ installing vimrc"
        install_vimrc
        ;;
    *)
        echo "================================ installing $1"
        install_$1
        ;;
esac

