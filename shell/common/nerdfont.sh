##BH |install_nerd_font|Install any nerd font from |
install_nerd_font()
{
    [ "$1" = "" ] && echo "Give valid font name" && return
    pushd /tmp
    wget $(gh_rel ryanoasis/nerd-fonts $1)
    [ ! -f $1.zip ] && echo "Unable to download font $1" && popd && return
    [ -d $1 ] && rm -rf $1
    mkdir $1
    pushd $1
    unzip ../$1.zip
    [ ! -d ~/.fonts ] && mkdir ~/.fonts
    cp ./* ~/.fonts/
    popd
    rm -rf $1 $1.zip
    popd
    return
    fc-cache -f -v
}

