#! /bin/bash

# set -x
# echo "****************** INSTALLATION STARTS HERE ************************"
devdir=$PWD
if [ "$devdir" != "$HOME/devenv" ]
then
    echo "Please install from ~/devenv"
    exit -1
fi
builddir=$devdir/build
mkdir $builddir
LOGFILE=$PWD/build/install.log
rm -rf $LOGFILE > /dev/null 2>&1
touch $LOGFILE
myname=$0
export DEBIAN_FRONTEND=noninteractive
ubver=$(cat /etc/lsb-release |grep RELEASE|cut -d= -f2)


shopt -s expand_aliases
. ./shell/bash/devenv_bashrc

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
    prv_install_bash_completions;
}

############################## INSTALLERS STARTS HERE ###################################

prv_node21 ()
{
    ce_dir nodejs
    sudo apt -yq install aptitude
    sudo aptitude -yq install libnode-dev
    sudo aptitude -yq install libnode64
    sudo aptitude -yq install node-gyp
    sudo aptitude -yq install npm
    # sudo apt install libnode72=12.21.0~dfsg-3ubuntu1
    sudo apt-get -yq update
    sudo apt-get -yq install nodejs
    sudo apt-get -yq install npm
    curl -sS -L https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
}

prv_node20()
{
    ce_dir nodejs
    curl -vs -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
    sudo bash nodesource_setup.sh
    sudo apt-get -yq update
    sudo apt-get -yq install nodejs
    sudo apt-get -yq install npm
}

tools_node()
{
    if [ "$ubver" = "21" ];then
        prv_install_node21
    else
        prv_install_node20
    fi
}

gem_pkg()
{
    for i in $@
    do
        sudo gem install $i
    done
}

npm_pkg()
{
    for i in $@
    do
        sudo npm i -g $i
    done
}

apt_pkg()
{
    for i in $@
    do
        sudo apt-get -yqm install $i
    done
}

cargo_pkg ()
{
    for i in $@
    do
        sudo cargo install $i
    done
}

pip_pkg()
{
    for i in $@
    do
        sudo pip3 install $i -U
        sudo pip2 install $i -U
    done
}


tools_pkgs ()
{
    local apt_pkgs="
        dos2unix
        apt-file
        rsync
        w3m
        w3m-img
        libbz2-dev
        curl
        cscope
        ctags
        python
        python3
        python3-pip
        exuberant-ctags
        universal-ctags
        snapd
        lfm
        plantuml
        ccls
        libgemplugin-ruby
        rubygems
        ruby-full
        clang-format
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
        xsel
        libxcb-composite0-dev
        bison
        flex
        pylint
        taskwarrior
        doxygen
        tasksh
        timewarrior
        zsh
        figlet
        toilet
        ninja-build
        ppa-purge
        jq
    "

    local gem_pkgs="
        nokogiri
    "
    apt_pkg $apt_pkgs
    gen_pkg $gem_pkgs
}

tools_googler_supports ()
{
    ce_dir googler
    sudo curl -sS -o /usr/bin/googler https://raw.githubusercontent.com/jarun/googler/v4.3.1/googler && sudo chmod +x /usr/bin/googler
    sudo apt-get -yqm install googler
    wget https://raw.githubusercontent.com/jarun/googler/master/auto-completion/bash/googler-completion.bash
    cp googler-completion.bash $builddir/bash_completions/
    wget https://raw.githubusercontent.com/jarun/googler/master/auto-completion/googler_at/googler_at
    cp googler_at $builddir/bash_completions
}

tools_bat()
{
    [ "$FORCE_INSTALL" == "" ] && bat --version|grep 'bat 0.17.1' && echo "bat already installed" && return;
    ce_dir bat
    wget $(gh_rel sharkdp/bat "bat_.*amd.*deb")
    sudo dpkg -i $(/usr/bin/ls -htr bat_*.deb|tail -1)
    set +x

}

tools_fzf ()
{
    [ "$FORCE_INSTALL" == "" ] && fzf --version && echo "fzf already installed" && return;
    echo "fzf installing..."
    ce_dir fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git fzf
    ./fzf/install --all
}

tools_ripgrep ()
{
    [ "$FORCE_INSTALL" == "" ] && rg -V| grep '^ripgrep 11' && echo "ripgrep already installed" && return;
    echo "ripgrep installing..."
    ce_dir rg
    curl -sS -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
    sudo dpkg -i ripgrep_11.0.2_amd64.deb
}

tools_pyenv ()
{
    [ "$FORCE_INSTALL" == "" ] && pyenv --version| grep "^pyenv " && echo "pyenv already installed" && return ;
    echo "pyenv installing..."
    rm -rf ~/.pyenv
    ce_dir pyenv
    curl -sS -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer |bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
    pyenv install 3.8.5
}

tools_yarn()
{
    [ "$FORCE_INSTALL" == "" ] && yarn --version| grep "^yarn " && echo "yarn already installed" && return ;
    echo "yarn installing..."
    ce_dir yarn
    rm -rf ~/.yarn
    curl -sS -L https://yarnpkg.com/install.sh | bash
}

tools_dotfiles()
{
    cp -rf dotfiles/.* ~/
}

tools_uncrustify ()
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

tools_fd ()
{
    ce_dir fdfind
    wget https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb
    sudo dpkg -i fd_8.2.1_amd64.deb
    cd $devdir
}

tools_fancydiff ()
{
    ce_dir fancydiff
    git clone https://github.com/so-fancy/diff-so-fancy.git

    cd $devdir
}

tools_gitconfig ()
{
    gconfig
}

tools_btoppp()
{
    ce_dir btop
    wget https://github.com/aristocratos/btop/releases/download/v1.1.3/btop-x86_64-linux-musl.tbz
    ex btop-x86_64-linux-musl.tbz
    make PREFIX=$PWD install
    sudo ln -sf $builddir/btop/bin/btop /usr/local/bin/btop
}

install_devtools()
{
    pkgs=$(cat $myname|grep "^tools_"|cut -d"(" -f1)
    for i in $pkgs
    do
        $i
    done
}

install_gui_albert()
{
    ce_dir albert
    curl -sS https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
    echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee -a /etc/apt/sources.list.d/home:manuelschneid3r.list
    sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
    sudo apt update
    sudo apt install albert
}

# unused installer
depre_install_gui_alacritty()
{
    local apt_pkgs="
    libxkbcommon-x11-dev 
    "
    apt_pkg $apt_pkgs
    ce_dir alacritty
    # sudo curl -sS https://sh.rustup.rs -sSf | sh
    git clone https://github.com/jwilm/alacritty.git
    cd alacritty
    cargo build --release
    chmod +x target/release/alacritty
    sudo ln -sf $PWD/target/release/alacritty /usr/bin/alacritty
    gzip -c extra/alacritty.man | sudo tee -a /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    cp extra/completions/alacritty.bash $builddir/bash_completions/
    ln -sf $builddir/dotfiles/alacritty.yml ~/.alacritty.yml
}

prv_install_bash_completions()
{
    if [ ! -d $builddir/bash_completions ]
    then
        mkdir $builddir/bash_completions
    fi
}


# install bashrc
prv_install_bashrc ()
{
    local apt_pkgs="
        fonts-powerline
        bash-completion
    "
    apt_pkg $apt_pkgs
    if [ "$DEVENV_LOADED" == "" ]
    then
        echo ". ~/devenv/shell/bash/devenv_bashrc" >> ~/.bashrc
        source ~/.bashrc
    fi
}

prv_install_zshrc ()
{
    ce_dir zsh

    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    echo $PWD
    ZSH=$PWD/ohmyzsh sh ./install.sh --unattended

    echo ". ~/devenv/shell/zsh/devenv_zshrc" >> ~/.zshrc
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
}

install_shell()
{
    prv_install_bashrc
    prv_install_zshrc
    prv_install_bash_completions
}

# install tmux
prv_install_tmux ()
{
    local VER="3.2"
    [ "$FORCE_INSTALL" == "" ] && tmux -V| grep "^tmux $VER" && echo "tmux already installed" && return ;
    echo "tmux installing..."
    local apt_pkgs="
        libevent-dev
        libncurses5-dev
        libncursesw5-dev
    "
    apt_pkg $apt_pkgs
    ce_dir tmux
    # curl -sS -LO https://github.com/tmux/tmux/releases/download/3.2-rc/tmux-3.2-rc3.tar.gz
    curl -sS -LO https://github.com/tmux/tmux/releases/download/$VER/tmux-$VER.tar.gz
    tar -xf tmux-$VER.tar.gz
    cd tmux-$VER
    ./configure
    sudo make install
    sudo ln -sf /usr/local/bin/tmux /usr/bin/tmux
}

# install tmux conf
prv_install_tmux_conf ()
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

install_tmux()
{
    prv_install_tmux
    prv_install_tmux_conf
}

prv_install_clangd ()
{
    # 10
    ce_dir clangd
    sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

    sudo ln -sf $(ls --color=never /usr/bin/clangd-* | tail -1) /usr/bin/clangd
}

prv_install_luals()
{

    ce_dir lua_ls
    # clone project
    git clone https://github.com/sumneko/lua-language-server
    cd lua-language-server
    git submodule update --init --recursive
    cd 3rd/luamake
    ./compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
}

prv_install_ls()
{
    local apt_pkgs="
        lua5.3
    "
    local pip_pkgs="
        jedi
        jedi-language-server
        python-language-server
        cmake-language-server
        python-lsp-server[all]
    "
    local npm_pkgs="
        bash-language-server
    "
    apt_pkg $apt_pkgs
    pip_pkg $pip_pkgs
    npm_pkg $npm_pkgs
    prv_install_luals
    prv_install_clangd
}

download_nvim()
{
    # curl -sS -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    curl -sS -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    sudo ln -sf $PWD/nvim.appimage /usr/local/bin/nvim
}

build_nvim()
{
    local apt_pkgs="
        ninja-build
        gettext
        libtool
        libtool-bin
        autoconf
        automake
        cmake
        g++
        pkg-config
        unzip
        curl
        doxygen
    "
    apt_pkg $apt_pkgs
    git clone --depth 1 https://github.com/neovim/neovim
    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo -j4 
    sudo make install
}

prv_install_nvim ()
{
    ce_dir nvim
    # download_nvim
    build_nvim
    mkdir -p ~/.config/nvim
    touch ~/.config/nvim/init.vim
    echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > ~/.config/nvim/init.vim
    echo "let &packpath = &runtimepath" >> ~/.config/nvim/init.vim
    echo "source ~/.vimrc" >> ~/.config/nvim/init.vim

    sudo pip3 install pynvim
    sudo pip3 install neovim
    sudo gem install neovim
    sudo npm install -g neovim
}

prv_install_vim ()
{
    if [ "$ubver" != "21" ];then
        sudo add-apt-repository -y ppa:jonathonf/vim
        sudo apt-get update
        sudo apt-get install vim
    fi
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
prv_install_ycm()
{
    cd ~/.vim/plugged/YouCompleteMe/
    ./install.py --clangd-completer --clang-completer
}

prv_install_coc()
{
    nvim --headless -c "CocInstall coc-clangd coc-ccls" -c 'qall!'
    fix_coc_ccls;
    ln -s -f $devdir/vim/coc-settings.json ~/.vim/
    ln -s -f $devdir/vim/coc-settings.json ~/.config/nvim/
    cd ~/.config/coc/extensions/node_modules/coc-ccls
    ln -s node_modules/ws/lib lib
    cd -
}

prv_install_plug()
{
    curl -sS -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    /usr/bin/vim -c 'PlugInstall!' -c 'qall!'
}

prv_install_packer ()
{
    ce_dir packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.vim/pack/packer/start/packer.nvim
    nvim --headless -c 'packadd packer.nvim | autocmd User PackerComplete quitall' -c 'PackerSync'
}

# get vimrc and install plugins
prv_install_vimrc ()
{
    ce_dir vimrc
    unlink ~/.vimrc > /dev/null 2>&1
    ln -s $devdir/vim/devenv.vimrc ~/.vimrc > /dev/null 2>&1

    # Install vim plug plugin manager
    ## remove already installed .vim directory
    unlink ~/.vim > /dev/null 2>&1
    rm -rf ~/.vim > /dev/null 2>&1
    mkdir -p ~/.vim/pack/packer/start/
    prv_install_plug
    prv_install_packer
    # prv_install_ycm
    # prv_install_coc
    mkdir ~/.vim/undodir
}

install_vim()
{
    local apt_pkgs="
        vifm
    "
    apt_pkg $apt_pkgs
    prv_install_nvim
    prv_install_vim
    prv_install_vimrc
    prv_install_ls
}

prv_install_test()
{
    echo "This is test function"
}

############################## SCRIPT STARTS HERE ###################################

list_packages ()
{
    pkgs=$(cat $myname|grep "^install_"|cut -d"_" -f2-|cut -d"(" -f1)
    echo $pkgs
}

usage ()
{
    echo "
./install.sh all [OPTIONS]               # Install all packages
./install.sh <package_name> [OPTIONS]    # Install specific package

OPTIONS :
    -f      Force install
    -j      just install - no apt related pre post hooks

<package_name> can be one of
    "
    echo $(list_packages) | tr ' ' '\n' | sed -e 's/^/\t\t/g'
    exit
}
preinst ()
{
    [ "$PLAIN_INSTALL" == "y" ] && return;
    sudo apt-get -yq autoremove
    sudo apt -yq autoremove
    sudo apt -yq --fix-broken install
    sudo apt-get -yq update && sudo apt-get -yq upgrade
    sudo dpkg --configure -a
    sudo apt-get -yq install -f
    sudo apt-get -yq clean
    prv_install_bash_completions;
}
postinst ()
{
    [ "$PLAIN_INSTALL" == "y" ] && return;
    sudo apt -yq --fix-broken install
    sudo apt-get -yq autoremove
    sudo apt -yq autoremove
    killall tail > /dev/null 2>&1
}

run_ninst_func ()
{
    $1 | tee -a $LOGFILE 2>&1
}

run_func ()
{
    if [ "$1" == "tools" ]
    then
        sudo apt-get -yq update
        sudo apt-get -yq upgrade
    fi
    install_$1 2>&1
}

# Check valid params given
[[ $# == 0 ]] && usage

# Check valid package or not
[[ "$1" == "all" || $(list_packages) =~ (^|[[:space:]])"$1"($|[[:space:]]) ]] && echo "Installing $1 ..." || usage

FORCE_INSTALL=""
PLAIN_INSTALL=""
app=""
for var in "$@"
do
    case $var in
        -f)
            export FORCE_INSTALL='y'
            ;;
        -j)
            export PLAIN_INSTALL='y'
            ;;
        *)
            app="$var"
            ;;
    esac
done

# Main execution
case $app in
    help)
        usage
        ;;
    all)
        run_ninst_func preinst
        run_ninst_func clean_dir;
        for i in $(list_packages)
        do
            echo "================================ CHECK AND INSTALL $i ================================"
            run_func $i
        done
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
