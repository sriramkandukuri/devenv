devdir=$PWD
LOGFILE=$PWD/install.log
rm -rf $LOGFILE > /dev/null 2>&1
touch $LOGFILE

if [ "$devdir" != "$HOME/devenv" ]
then
    echo "Please install from ~/devenv"
    exit -1
fi
. ./bashrc
builddir=$devdir/build

#crate and enter specific directory
ce_dir ()
{
    rm -rf $builddir/$1 > /dev/null;
    mcd $builddir/$1
}

clean_dir ()
{
    rm -rf build
    mcd build
}

install_bash_completions()
{
    if [ ! -d $builddir/bash_completions ]
    then
        mkdir $builddir/bash_completions
    fi
}

install_tools ()
{
    local apt_pkgs="
        apt-file
        curl
        cscope
        lua5.3
        ctags
        python 
        python3 
        python3-pip
        exuberant-ctags 
        universal-ctags 
        snapd 
        fonts-powerline 
        bash-completion 
        lfm 
        vifm 
        libevent-dev 
        libevent-dev
        plantuml
        doxygen 
        ccls 
        libgemplugin-ruby 
        rubygems 
        clang-format
        libncurses5-dev 
        libncursesw5-dev 
        p7zip-full 
        cmake 
        lynx 
        ruby 
        ruby-dev
        python-pip
        fuse
        cargo
        cmake
        libfreetype6-dev
        libfontconfig1-dev
        xclip
        libxcb-composite0-dev
    "

    local npm_pkgs="
        bash-language-server
    "

    local gem_pkgs="
        nokogiri
    "
    sudo apt-get -yq update >> $LOGFILE 2>&1 
    sudo apt-get -yq upgrade >> $LOGFILE 2>&1
    for i in $apt_pkgs
    do
        sudo apt-get -yqm install $i >> $LOGFILE 2>&1
    done

    for i in $gem_pkgs
    do
        sudo gem install $i >> $LOGFILE 2>&1
    done

    for i in $npm_pkgs
    do
        sudo npm i -g $i >> $LOGFILE 2>&1
    done

    for i in $cargo_pkgs
    do
        sudo cargo install $i >> $LOGFILE 2>&1
    done
}

install_albert()
{
    ce_dir albert
    curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
    echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
    sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
    sudo apt update
    sudo apt install albert
}


install_alacritty()
{
    ce_dir alacritty
    # sudo curl https://sh.rustup.rs -sSf | sh
    git clone https://github.com/jwilm/alacritty.git
    cd alacritty
    cargo build --release
    chmod +x target/release/alacritty
    sudo ln -sf $PWD/target/release/alacritty /usr/alacritty
    gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    cp extra/completions/alacritty.bash $builddir/bash_completions/ 
    ln -sf $builddir/dotfiles/alacritty.yml ~/.alacritty.yml
}

install_bat()
{
    bat --version|grep 'bat 0.17.1' && echo "bat already installed" && return;
    ce_dir bat
    wget $(gh_rel sharkdp/bat "bat_.*amd.*deb") >> $LOGFILE 2>&1
    sudo dpkg -i $(ls -htr bat_*.deb|tail -1) >> $LOGFILE 2>&1 
 
}

install_fzf ()
{
    fzf --version && echo "fzf already installed" && return;
    echo "fzf not found so installing..."
    ce_dir fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git fzf
    ./fzf/install --all >> $LOGFILE 2>&1
}

install_ripgrep ()
{
    rg -V| grep '^ripgrep 11' && echo "ripgrep already installed" && return;
    echo "ripgrep not found so installing..."
    ce_dir rg
    curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb >> $LOGFILE 2>&1
    sudo dpkg -i ripgrep_11.0.2_amd64.deb >> $LOGFILE 2>&1
}

# install tmux
install_tmux ()
{
    local VER="3.2-rc3"
    tmux -V| grep "^tmux $VER" && echo "tmux already installed" && return ;
    echo "tmux not found so installing..."
    ce_dir tmux
    curl -LO https://github.com/tmux/tmux/releases/download/3.2-rc/tmux-3.2-rc3.tar.gz >> $LOGFILE 2>&1
#    curl -LO https://github.com/tmux/tmux/releases/download/$VER/tmux-$VER.tar.gz >> $LOGFILE 2>&1
    tar -xf tmux-$VER.tar.gz >> $LOGFILE 2>&1
    cd tmux-$VER
    ./configure >> $LOGFILE 2>&1 && make >> $LOGFILE 2>&1
    sudo make install >> $LOGFILE 2>&1
}
install_pyenv ()
{
    pyenv --version| grep "^pyenv " && echo "pyenv already installed" && return ;
    echo "pyenv not found so installing..."
    ce_dir pyenv
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer |bash
    pyenv install 3.8.5
}

install_yarn()
{
    yarn --version| grep "^yarn " && echo "yarn already installed" && return ;
    echo "yarn not found so installing..."
    ce_dir yarn
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
}
# install tmux conf
install_tmux_conf ()
{
    ce_dir tmuxconf
    git clone https://github.com/gpakosz/.tmux.git >> $LOGFILE 2>&1
    unlink ~/.tmux.conf.local > /dev/null 2>&1
    unlink ~/.tmux.conf > /dev/null 2>&1
    unlink ~/.mytmux.conf > /dev/null 2>&1
    ln -s -f $PWD/.tmux/.tmux.conf ~/
    ln -s -f $PWD/.tmux/.tmux.conf.local ~/
    ln -s -f $devdir/mytmux.conf ~/.mytmux.conf
    echo "source-file ~/.mytmux.conf" >> ~/.tmux.conf.local
}

# install bashrc
install_bashrc ()
{
    if [ "$DEVENV_LOADED" == "" ]
    then
        echo ". ~/devenv/bashrc" >> ~/.bashrc
        source ~/.bashrc
    fi
}

install_clangd ()
{
    # 10
    ce_dir clangd
    sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" >> $LOGFILE 2>&1

    sudo ln -sf /usr/bin/clangd-11 /usr/bin/clangd
}

install_nvim ()
{
    ce_dir nvim
#    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    sudo ln -sf $PWD/nvim.appimage /usr/local/bin/nvim
    mkdir -p ~/.config/nvim
    touch ~/.config/nvim/init.vim
    echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > ~/.config/nvim/init.vim
    echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
    echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
    python -m pip uninstall neovim pynvim
    python -m pip install --user --upgrade pynvim

    python3 -m pip install --user --upgrade pynvim
    python2 -m pip install --user --upgrade pynvim

    sudo pip3 install pynvim >> $LOGFILE 2>&1 
    sudo pip3 install neovim >> $LOGFILE 2>&1 
    # pip3 install --user neovim >> $LOGFILE 2>&1
    sudo gem install neovim >> $LOGFILE 2>&1 
    sudo npm install -g neovim >> $LOGFILE 2>&1 
}

install_vim ()
{
    sudo add-apt-repository -y ppa:jonathonf/vim >> $LOGFILE 2>&1 
    sudo apt update >> $LOGFILE 2>&1 
    sudo apt install vim >> $LOGFILE 2>&1 
}
fix_coc_ccls()
{
    existing=~/.config/coc/extensions/node_modules/coc-ccls/node_modules/ws/lib/extension.js
    missing=~/.config/coc/extensions/node_modules/coc-ccls/lib/extension.js
    if [[ -e "$existing" && ! -e "$missing" ]]; then
        mkdir -p "$(dirname "$missing")"
        ln -s "$existing" "$missing"
    fi
}

# get vimrc and install plugins
install_vimrc ()
{
    ce_dir vimrc
    unlink ~/.vimrc > /dev/null 2>&1
    ln -s $devdir/myvimrc ~/.vimrc > /dev/null 2>&1

    # Install vim plug plugin manager
    ## remove already installed .vim directory
    unlink ~/.vim > /dev/null 2>&1
    rm -rf ~/.vim > /dev/null 2>&1
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> $LOGFILE 2>&1 
    vim +PlugInstall +qall! >> $LOGFILE 2>&1
    vim -c "CocInstall coc-clangd coc-ccls" -c "qall" >> $LOGFILE 2>&1
    vim -c "TSInstall c cpp bash python" -c "qall" >> $LOGFILE 2>&1
    fix_coc_ccls;
    cd ~/.vim/plugged/YouCompleteMe/
    ./install.py --clangd-completer --clang-completer >> $LOGFILE  2>&1
    ln -s -f $devdir/coc.vimrc ~/.cocvrc
    ln -s -f $devdir/coc-settings.json ~/.vim/
    ln -s -f $devdir/coc-settings.json ~/.config/nvim/
    cd ~/.config/coc/extensions/node_modules/coc-ccls
    ln -s node_modules/ws/lib lib
    cd -
    mkdir ~/.vim/undodir
}

install_node ()
{
    sudo apt-get -yq update >> $LOGFILE 2>&1 
    sudo apt-get -yq install nodejs >> $LOGFILE 2>&1 
    sudo apt-get -yq install npm >> $LOGFILE 2>&1 
}

#set -x
[[ "$2" == "-v" ]] && tail -f $LOGFILE &
sudo apt-get clean
install_bash_completions
case $1 in
    all)
        clean_dir;
        echo "================================ CHECK AND INSTALL tools ================================"
        install_tools
        echo "================================ CHECK AND INSTALL fzf ================================"
        install_fzf
        echo "================================ CHECK AND INSTALL clangd ================================"
        install_clangd
        echo "================================ CHECK AND INSTALL yarn ================================"
        install_yarn
        echo "================================ CHECK AND INSTALL node ================================"
        install_node
        echo "================================ CHECK AND INSTALL bashrc ================================"
        install_bashrc
        echo "================================ CHECK AND INSTALL tmux ================================"
        install_tmux
        echo "================================ CHECK AND INSTALL tmux_conf ================================"
        install_tmux_conf
        echo "================================ CHECK AND INSTALL nvim ================================"
        install_nvim
        echo "================================ CHECK AND INSTALL vim ================================"
        install_vim
        echo "================================ CHECK AND INSTALL ripgrep ================================"
        install_ripgrep
        echo "================================ CHECK AND INSTALL vimrc ================================"
        install_vimrc
        echo "================================ CHECK AND INSTALL pyenv ================================"
        install_pyenv
        echo "================================ CHECK AND INSTALL bat ================================"
        install_bat
        ;;
    fix)
        fix_coc_ccls;
        ;;
    *)
        echo "================================ CHECK AND INSTALL $1 ================================"
        install_$1
        ;;
esac
sudo apt-get -y autoremove >> $LOGFILE 2>&1 
