curdir=$PWD

if [ "$curdir" != "$HOME/devenv" ]
then
    echo "Please install from ~/devenv"
    exit -1
fi

rm -rf build
mkdir build
cd build

builddir=$curdir/build

# install tmux
install_tmux ()
{
    mkdir tmux
    cd tmux
    wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz
    tar -xf tmux-3.1.tar.gz
    cd tmux-3.1
    ./configure && make
    sudo make install
    cd $builddir
}

# install tmux conf
install_tmux_conf ()
{
    mkdir tmuxconf
    cd tmuxconf
    git clone https://github.com/gpakosz/.tmux.git
    unlink ~/.otmux.conf
    unlink ~/.tmux.conf.local
    unlink ~/.tmux.conf
    ln -s -f .tmux/.tmux.conf ~/.otmux.conf
    ln -s -f .tmux/.tmux.conf.local ~/
    ln -s $curdir/mytmux.conf ~/.tmux.conf
    cd $builddir
}

# install bashrc
install_bashrc ()
{
    echo "Add '. ~/devenv/bashrc'  to ~/.bashrc"
}

install_vim ()
{
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update
    sudo apt install vim
}

# get vimrc and install plugins
install_vimrc ()
{
    mkdir vimrc
    cd vimrc
    git clone https://github.com/erkrnt/awesome-streamerrc.git
    cp awesome-streamerrc/ThePrimeagen/.vimrc $curdir/open_vimrc
    unlink ~/ovrc
    unlink ~/.vimrc
    ln -s $curdir/open_vimrc ~/.ovrc
    ln -s $curdir/myvimrc ~/.vimrc

    # Install vim plug plugin manager
    ## remove already installed .vim directory
    unlink ~/.vim
    rm -rf ~/.vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
}

install_bashrc
install_tmux
install_tmux_conf
intall_vim
install_vimrc
