##BH |install_nf|Install any nerd font from github release|
install_nf()
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

##BH |install_all_nf|Install all nerd fonts from github release|
install_all_nf()
{
flist="
3270
Agave
AnonymousPro
Arimo
AurulentSansMono
BigBlueTerminal
BitstreamVeraSansMono
CascadiaCode
CodeNewRoman
Cousine
DaddyTimeMono
DejaVuSansMono
DroidSansMono
FantasqueSansMono
FiraCode
FiraMono
Go-Mono
Gohu
Hack
Hasklig
HeavyData
Hermit
iA-Writer
IBMPlexMono
Inconsolata
InconsolataGo
InconsolataLGC
Iosevka
JetBrainsMono
Lekton
LiberationMono
Meslo
Monofur
Monoid
Mononoki
MPlus
Noto
OpenDyslexic
Overpass
ProFont
ProggyClean
RobotoMono
ShareTechMono
SourceCodePro
SpaceMono
Terminus
Tinos
Ubuntu
UbuntuMono
VictorMono
"
    for font in $flist
    do
        echo $font
        install_nf $font
    done
}
