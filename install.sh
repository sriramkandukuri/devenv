#! /bin/bash

# set -x
# echo "****************** INSTALLATION STARTS HERE ************************"
devdir=$PWD
LOGFILE=$PWD/install.log
rm -rf $LOGFILE > /dev/null 2>&1
touch $LOGFILE
myname=$0
export DEBIAN_FRONTEND=noninteractive

if [ "$devdir" != "$HOME/devenv" ]
then
    echo "Please install from ~/devenv"
    exit -1
fi
builddir=$devdir/build

shopt -s expand_aliases
. ./bashrc

#crate and enter specific directory
ce_dir ()
{
    rm -rf $builddir/$1 > /dev/null;
    mkcd $builddir/$1
}

clean_dir ()
{
    rm -rf build
    mkcd build
    install_bash_completions;
}

############################## INSTALLERS STARTS HERE ###################################

install_tools ()
{
    local apt_pkgs="
        apt-file
        rsync
        w3m
        w3m-img
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
        bison
        flex
        pylint
        taskwarrior
        tasksh
        timewarrior
    "

    local npm_pkgs="
        bash-language-server
    "

    local gem_pkgs="
        nokogiri
    "

    local pip_pkgs="
        jedi
        jedi-language-server
    "
    sudo apt-get -yq update
    sudo apt-get -yq upgrade
    for i in $apt_pkgs
    do
        sudo apt-get -yqm install $i
    done

    for i in $gem_pkgs
    do
        sudo gem install $i
    done

    for i in $npm_pkgs
    do
        sudo npm i -g $i
    done

    for i in $cargo_pkgs
    do
        sudo cargo install $i
    done

    for i in $pip_pkgs
    do
        sudo pip3 install $i
        sudo pip install $i
    done
}

install_bash_completions()
{
    if [ ! -d $builddir/bash_completions ]
    then
        mkdir $builddir/bash_completions
    fi
}

install_googler_supports ()
{
    ce_dir googler
    sudo curl -vs -o /usr/bin/googler https://raw.githubusercontent.com/jarun/googler/v4.3.1/googler && sudo chmod +x /usr/bin/googler
    sudo apt-get -yqm install googler
    wget https://raw.githubusercontent.com/jarun/googler/master/auto-completion/bash/googler-completion.bash
    cp googler-completion.bash $builddir/bash_completions/
    wget https://raw.githubusercontent.com/jarun/googler/master/auto-completion/googler_at/googler_at
    cp googler_at $builddir/bash_completions
}

install_albert()
{
    ce_dir albert
    curl -vs https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
    echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee -a /etc/apt/sources.list.d/home:manuelschneid3r.list
    sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
    sudo apt update
    sudo apt install albert
}

install_alacritty()
{
    ce_dir alacritty
    # sudo curl -vs https://sh.rustup.rs -sSf | sh
    git clone https://github.com/jwilm/alacritty.git
    cd alacritty
    cargo build --release
    chmod +x target/release/alacritty
    sudo ln -sf $PWD/target/release/alacritty /usr/bin/alacritty
    gzip -c extra/alacritty.man | sudo tee -a /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    cp extra/completions/alacritty.bash $builddir/bash_completions/
    ln -sf $builddir/dotfiles/alacritty.yml ~/.alacritty.yml
}

install_bat()
{
    [ "$FORCE_INSTALL" == "" ] && bat --version|grep 'bat 0.17.1' && echo "bat already installed" && return;
    ce_dir bat
    wget $(gh_rel sharkdp/bat "bat_.*amd.*deb")
    sudo dpkg -i $(ls -htr bat_*.deb|tail -1)

}

install_fzf ()
{
    [ "$FORCE_INSTALL" == "" ] && fzf --version && echo "fzf already installed" && return;
    echo "fzf installing..."
    ce_dir fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git fzf
    ./fzf/install --all
}

install_ripgrep ()
{
    [ "$FORCE_INSTALL" == "" ] && rg -V| grep '^ripgrep 11' && echo "ripgrep already installed" && return;
    echo "ripgrep installing..."
    ce_dir rg
    curl -vs -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
    sudo dpkg -i ripgrep_11.0.2_amd64.deb
}

# install tmux
install_tmux ()
{
    local VER="3.2"
    [ "$FORCE_INSTALL" == "" ] && tmux -V| grep "^tmux $VER" && echo "tmux already installed" && return ;
    echo "tmux installing..."
    ce_dir tmux
    # curl -vs -LO https://github.com/tmux/tmux/releases/download/3.2-rc/tmux-3.2-rc3.tar.gz
    curl -vs -LO https://github.com/tmux/tmux/releases/download/$VER/tmux-$VER.tar.gz
    tar -xf tmux-$VER.tar.gz
    cd tmux-$VER
    ./configure
    sudo make install
}
install_pyenv ()
{
    [ "$FORCE_INSTALL" == "" ] && pyenv --version| grep "^pyenv " && echo "pyenv already installed" && return ;
    echo "pyenv installing..."
    rm -rf ~/.pyenv
    ce_dir pyenv
    curl -vs -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer |bash
    pyenv install 3.8.5
}

install_yarn()
{
    [ "$FORCE_INSTALL" == "" ] && yarn --version| grep "^yarn " && echo "yarn already installed" && return ;
    echo "yarn installing..."
    ce_dir yarn
    curl -vs --compressed -o- -L https://yarnpkg.com/install.sh | bash
}
# install tmux conf
install_tmux_conf ()
{
    ce_dir tmuxconf
    git clone https://github.com/gpakosz/.tmux.git
    unlink ~/.tmux.conf.local > /dev/null 2>&1
    unlink ~/.tmux.conf > /dev/null 2>&1
    unlink ~/.mytmux.conf > /dev/null 2>&1
    unlink ~/.devenv_tmux.conf > /dev/null 2>&1
    ln -s -f $PWD/.tmux/.tmux.conf ~/
    ln -s -f $PWD/.tmux/.tmux.conf.local ~/
    ln -s -f $devdir/tmux/tmux.conf ~/.devenv_tmux.conf
    echo "source-file ~/.devenv_tmux.conf" >> ~/.tmux.conf.local
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
    sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

    sudo ln -sf /usr/bin/clangd-11 /usr/bin/clangd
}

install_nvim ()
{
    ce_dir nvim
#    curl -vs -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    curl -vs -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
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

    sudo pip3 install pynvim
    sudo pip3 install neovim

    python -m pip -y uninstall neovim pynvim
    python -m pip -y install --user --upgrade pynvim

    python3 -m pip -y install --user --upgrade pynvim
    python2 -m pip install --user --upgrade pynvim

    sudo pip3 -y install pynvim
    sudo pip3 -y install neovim
    # pip3 install --user neovim
    sudo gem install neovim
    sudo npm install -g neovim
}

install_vim ()
{
    sudo add-apt-repository -y ppa:jonathonf/vim
    sudo apt-get update
    sudo apt-get install vim
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
    curl -vs -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim --headless -c 'PlugInstall' -c "CocInstall coc-clangd coc-ccls" -c 'qall!'
    fix_coc_ccls;
    cd ~/.vim/plugged/YouCompleteMe/
    ./install.py --clangd-completer --clang-completer
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
    ce_dir nodejs
    curl -vs -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    sudo apt-get -yq update
    sudo apt-get -yq install nodejs
    sudo apt-get -yq install npm
}

install_dotfiles()
{
    cp -rf dotfiles/.* ~/
}

install_uncrustify ()
{
    ce_dir uncrustify
    git clone --depth=1 https://github.com/uncrustify/uncrustify.git
    cd uncrustify
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    sudo ln -s -f $PWD/uncrustify /usr/local/bin
    cd $devdir
}

install_fd ()
{
    ce_dir fdfind
    wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
    sudo dpkg -i fd_8.2.1_amd64.deb
    cd $devdir
}

install_fancydiff ()
{
    ce_dir fancydiff
    git clone https://github.com/so-fancy/diff-so-fancy.git

    cd $devdir
}

install_gitconfig ()
{
    gconfig
}

############################## SCRIPT STARTS HERE ###################################

list_packages ()
{
    pkgs=$(cat $myname|grep "^install_"|cut -d"_" -f2-|cut -d"(" -f1)
    pkgs="$pkgs all"
    echo $pkgs
}

usage ()
{
    echo "
./install.sh all [OPTIONS]               # Install all packages
./install.sh <package name> [OPTIONS]    # Install specific package

OPTIONS :
    -v      Enable verbose logging
    -f      Force install

<package name> can be one of [ $(list_packages) ]
    "
    exit
}
preinst ()
{
    sudo apt-get clean
    install_bash_completions;
}
postinst ()
{
    sudo apt-get -yq autoremove
    killall tail > /dev/null 2>&1
}

run_ninst_func ()
{
    $1 | tee -a $LOGFILE >> /dev/null 2>&1
}

run_func ()
{
    install_$1 2>&1 | stdbuf -oL tr '\r' '\n' >> $LOGFILE
}

# Check valid params given
[[ $# == 0 ]] && usage

# Check valid package or not
[[ $(list_packages) =~ (^|[[:space:]])"$1"($|[[:space:]]) ]] && echo "Installing $1 ..." || usage

# Check verbose
[[ "$2" == "-v" ]] && tail -f -n0 $LOGFILE &

# Check verbose
FORCE_INSTALL=""
[[ "$3" == "-f" ]] && export FORCE_INSTALL='Y'

# Main execution
case $1 in
    help)
        usage
        ;;
    all)
        run_ninst_func preinst
        run_ninst_func clean_dir;
        echo "================================ CHECK AND INSTALL tools ================================"
        run_func tools
        echo "================================ CHECK AND INSTALL fzf ================================"
        run_func fzf
        echo "================================ CHECK AND INSTALL clangd ================================"
        run_func clangd
        echo "================================ CHECK AND INSTALL yarn ================================"
        run_func yarn
        echo "================================ CHECK AND INSTALL node ================================"
        run_func node
        echo "================================ CHECK AND INSTALL bashrc ================================"
        run_func bashrc
        echo "================================ CHECK AND INSTALL tmux ================================"
        run_func tmux
        echo "================================ CHECK AND INSTALL tmux_conf ================================"
        run_func tmux_conf
        echo "================================ CHECK AND INSTALL nvim ================================"
        run_func nvim
        echo "================================ CHECK AND INSTALL vim ================================"
        run_func vim
        echo "================================ CHECK AND INSTALL ripgrep ================================"
        run_func ripgrep
        echo "================================ CHECK AND INSTALL vimrc ================================"
        run_func vimrc
        echo "================================ CHECK AND INSTALL pyenv ================================"
        run_func pyenv
        echo "================================ CHECK AND INSTALL bat ================================"
        run_func bat
        echo "================================ CHECK AND INSTALL googler addons ================================"
        run_func googler_supports
        echo "================================ CHECK AND INSTALL dotfiles ================================"
        run_func dotfiles
        echo "================================ CHECK AND INSTALL fd-find ================================"
        run_func fd
        echo "================================ CHECK AND INSTALL fancy diff ================================"
        run_func fancydiff
        echo "================================ CHECK AND INSTALL gitconfig ================================"
        run_func gitconfig
        run_ninst_func postinst
        ;;
    fix)
        run_ninst_func fix_coc_ccls;
        ;;
    *)
        run_ninst_func preinst
        echo "================================ CHECK AND INSTALL $1 ================================"
        run_func $1
        run_ninst_func postinst
        ;;
esac
