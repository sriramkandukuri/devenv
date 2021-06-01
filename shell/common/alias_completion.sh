function _alias_completion::? {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(type -a ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/?/type -a}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::? ?
function _alias_completion::@a {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w amazon.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@a/googler -w amazon.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@a @a
function _alias_completion::@abbs {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w bbs.archlinux.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@abbs/googler -w bbs.archlinux.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@abbs @abbs
function _alias_completion::@alt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w alternativeto.net ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@alt/googler -w alternativeto.net}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@alt @alt
function _alias_completion::@android {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w developer.android.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@android/googler -w developer.android.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@android @android
function _alias_completion::@arm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w infocenter.arm.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@arm/googler -w infocenter.arm.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@arm @arm
function _alias_completion::@asciinema {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w asciinema.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@asciinema/googler -w asciinema.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@asciinema @asciinema
function _alias_completion::@askubuntu {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w askubuntu.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@askubuntu/googler -w askubuntu.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@askubuntu @askubuntu
function _alias_completion::@aur {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w aur.archlinux.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@aur/googler -w aur.archlinux.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@aur @aur
function _alias_completion::@aw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w wiki.archlinux.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@aw/googler -w wiki.archlinux.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@aw @aw
function _alias_completion::@azl {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w azlyrics.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@azl/googler -w azlyrics.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@azl @azl
function _alias_completion::@bbc {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w bbc.co.uk ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@bbc/googler -w bbc.co.uk}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@bbc @bbc
function _alias_completion::@britannica {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w britannica.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@britannica/googler -w britannica.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@britannica @britannica
function _alias_completion::@cb {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w crunchbase.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cb/googler -w crunchbase.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cb @cb
function _alias_completion::@chrome {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w chrome.google.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@chrome/googler -w chrome.google.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@chrome @chrome
function _alias_completion::@cl {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w craigslist.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cl/googler -w craigslist.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cl @cl
function _alias_completion::@cmd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w commandlinefu.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cmd/googler -w commandlinefu.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cmd @cmd
function _alias_completion::@cnn {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w cnn.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cnn/googler -w cnn.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cnn @cnn
function _alias_completion::@comedy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w cc.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@comedy/googler -w cc.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@comedy @comedy
function _alias_completion::@cpp {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w en.cppreference.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cpp/googler -w en.cppreference.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cpp @cpp
function _alias_completion::@cracked {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w cracked.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cracked/googler -w cracked.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cracked @cracked
function _alias_completion::@cricinfo {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w espncricinfo.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@cricinfo/googler -w espncricinfo.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@cricinfo @cricinfo
function _alias_completion::@d {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w thefreedictionary.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@d/googler -w thefreedictionary.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@d @d
function _alias_completion::@di {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w dictionary.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@di/googler -w dictionary.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@di @di
function _alias_completion::@distrowatch {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w distrowatch.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@distrowatch/googler -w distrowatch.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@distrowatch @distrowatch
function _alias_completion::@dnr {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w dailynaturalremedies.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@dnr/googler -w dailynaturalremedies.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@dnr @dnr
function _alias_completion::@dpkg {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w packages.debian.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@dpkg/googler -w packages.debian.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@dpkg @dpkg
function _alias_completion::@e {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w ebay.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@e/googler -w ebay.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@e @e
function _alias_completion::@eg {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w epguides.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@eg/googler -w epguides.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@eg @eg
function _alias_completion::@embedded {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w embedded.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@embedded/googler -w embedded.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@embedded @embedded
function _alias_completion::@espn {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w espn.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@espn/googler -w espn.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@espn @espn
function _alias_completion::@etsy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w etsy.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@etsy/googler -w etsy.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@etsy @etsy
function _alias_completion::@etym {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w etymonline.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@etym/googler -w etymonline.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@etym @etym
function _alias_completion::@fb {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w facebook.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@fb/googler -w facebook.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@fb @fb
function _alias_completion::@fd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w fandango.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@fd/googler -w fandango.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@fd @fd
function _alias_completion::@firefox {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w addons.mozilla.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@firefox/googler -w addons.mozilla.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@firefox @firefox
function _alias_completion::@forbes {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w forbes.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@forbes/googler -w forbes.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@forbes @forbes
function _alias_completion::@forvo {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w forvo.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@forvo/googler -w forvo.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@forvo @forvo
function _alias_completion::@ft {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w markets.ft.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ft/googler -w markets.ft.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ft @ft
complete -F _googler @g
function _alias_completion::@genius {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w genius.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@genius/googler -w genius.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@genius @genius
function _alias_completion::@gh {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w github.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@gh/googler -w github.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@gh @gh
function _alias_completion::@gnu {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w gnu.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@gnu/googler -w gnu.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@gnu @gnu
function _alias_completion::@gpg {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w gnupg.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@gpg/googler -w gnupg.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@gpg @gpg
function _alias_completion::@gutenberg {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w gutenberg.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@gutenberg/googler -w gutenberg.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@gutenberg @gutenberg
function _alias_completion::@had {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w hackaday.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@had/googler -w hackaday.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@had @had
function _alias_completion::@history {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w history.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@history/googler -w history.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@history @history
function _alias_completion::@hl {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w healthline.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@hl/googler -w healthline.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@hl @hl
function _alias_completion::@hn {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w news.ycombinator.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@hn/googler -w news.ycombinator.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@hn @hn
function _alias_completion::@hsw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w howstuffworks.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@hsw/googler -w howstuffworks.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@hsw @hsw
function _alias_completion::@htf {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w howtoforge.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@htf/googler -w howtoforge.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@htf @htf
function _alias_completion::@hulu {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w hulu.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@hulu/googler -w hulu.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@hulu @hulu
function _alias_completion::@ieee {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w ieee.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ieee/googler -w ieee.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ieee @ieee
function _alias_completion::@ietf {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w ietf.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ietf/googler -w ietf.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ietf @ietf
function _alias_completion::@ietfd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w datatracker.ietf.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ietfd/googler -w datatracker.ietf.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ietfd @ietfd
function _alias_completion::@ig {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w instagram.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ig/googler -w instagram.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ig @ig
function _alias_completion::@imdb {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w imdb.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@imdb/googler -w imdb.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@imdb @imdb
function _alias_completion::@iradio {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w internet-radio.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@iradio/googler -w internet-radio.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@iradio @iradio
function _alias_completion::@kernel {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w kernel.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@kernel/googler -w kernel.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@kernel @kernel
function _alias_completion::@khan {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w khanacademy.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@khan/googler -w khanacademy.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@khan @khan
function _alias_completion::@lfm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w last.fm ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@lfm/googler -w last.fm}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@lfm @lfm
function _alias_completion::@li {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w linkedin.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@li/googler -w linkedin.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@li @li
function _alias_completion::@linux {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w linux.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@linux/googler -w linux.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@linux @linux
function _alias_completion::@lj {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w linuxjournal.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@lj/googler -w linuxjournal.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@lj @lj
function _alias_completion::@lq {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w linuxquestions.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@lq/googler -w linuxquestions.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@lq @lq
function _alias_completion::@lqw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w wiki.linuxquestions.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@lqw/googler -w wiki.linuxquestions.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@lqw @lqw
function _alias_completion::@lwn {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w lwn.net ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@lwn/googler -w lwn.net}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@lwn @lwn
function _alias_completion::@lxr {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w lxr.free-electrons.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@lxr/googler -w lxr.free-electrons.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@lxr @lxr
function _alias_completion::@man {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w manpages.ubuntu.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@man/googler -w manpages.ubuntu.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@man @man
function _alias_completion::@man7 {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w man7.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@man7/googler -w man7.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@man7 @man7
function _alias_completion::@mangar {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w mangareader.net ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@mangar/googler -w mangareader.net}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@mangar @mangar
function _alias_completion::@mlb {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w mlb.mlb.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@mlb/googler -w mlb.mlb.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@mlb @mlb
function _alias_completion::@mr {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w macrumors.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@mr/googler -w macrumors.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@mr @mr
function _alias_completion::@n {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(googler -N ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@n/googler -N}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@n @n
function _alias_completion::@nature {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -N nature.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@nature/googler -N nature.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@nature @nature
function _alias_completion::@nba {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -N nba.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@nba/googler -N nba.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@nba @nba
function _alias_completion::@ng {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -N nationalgeographic.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ng/googler -N nationalgeographic.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ng @ng
function _alias_completion::@nptel {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w nptel.ac.in ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@nptel/googler -w nptel.ac.in}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@nptel @nptel
function _alias_completion::@ocw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w ocw.mit.edu ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ocw/googler -w ocw.mit.edu}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ocw @ocw
function _alias_completion::@oembedded {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w openembedded.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@oembedded/googler -w openembedded.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@oembedded @oembedded
function _alias_completion::@op {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w opensubtitles.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@op/googler -w opensubtitles.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@op @op
function _alias_completion::@opensource {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w opensource.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@opensource/googler -w opensource.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@opensource @opensource
function _alias_completion::@osalt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w osalt.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@osalt/googler -w osalt.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@osalt @osalt
function _alias_completion::@osdev {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w wiki.osdev.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@osdev/googler -w wiki.osdev.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@osdev @osdev
function _alias_completion::@owrt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w openwrt.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@owrt/googler -w openwrt.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@owrt @owrt
function _alias_completion::@ox {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w en.oxforddictionaries.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ox/googler -w en.oxforddictionaries.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ox @ox
function _alias_completion::@patent {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w patents.google.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@patent/googler -w patents.google.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@patent @patent
function _alias_completion::@pirate {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w thepiratebay.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@pirate/googler -w thepiratebay.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@pirate @pirate
function _alias_completion::@play {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w play.google.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@play/googler -w play.google.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@play @play
function _alias_completion::@playonlinux {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w playonlinux.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@playonlinux/googler -w playonlinux.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@playonlinux @playonlinux
function _alias_completion::@python {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w docs.python.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@python/googler -w docs.python.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@python @python
function _alias_completion::@quotes {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w en.wikiquote.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@quotes/googler -w en.wikiquote.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@quotes @quotes
function _alias_completion::@r {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w reddit.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@r/googler -w reddit.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@r @r
function _alias_completion::@rd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w rd.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@rd/googler -w rd.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@rd @rd
function _alias_completion::@rfc {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w rfc-editor.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@rfc/googler -w rfc-editor.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@rfc @rfc
function _alias_completion::@rpm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w rpmfind.net ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@rpm/googler -w rpmfind.net}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@rpm @rpm
function _alias_completion::@rt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w rottentomatoes.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@rt/googler -w rottentomatoes.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@rt @rt
function _alias_completion::@slang {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w onlineslangdictionary.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@slang/googler -w onlineslangdictionary.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@slang @slang
function _alias_completion::@so {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w stackoverflow.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@so/googler -w stackoverflow.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@so @so
function _alias_completion::@softpedia {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w softpedia.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@softpedia/googler -w softpedia.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@softpedia @softpedia
function _alias_completion::@sourceforge {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w sourceforge.net ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@sourceforge/googler -w sourceforge.net}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@sourceforge @sourceforge
function _alias_completion::@ss {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w subscene.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ss/googler -w subscene.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ss @ss
function _alias_completion::@st {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w store.steampowered.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@st/googler -w store.steampowered.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@st @st
function _alias_completion::@t {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w thesaurus.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@t/googler -w thesaurus.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@t @t
function _alias_completion::@ted {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w ted.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ted/googler -w ted.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ted @ted
function _alias_completion::@tldp {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w tldp.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@tldp/googler -w tldp.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@tldp @tldp
function _alias_completion::@tldrlegal {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w tldrlegal.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@tldrlegal/googler -w tldrlegal.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@tldrlegal @tldrlegal
function _alias_completion::@to {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w torrentz2.eu ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@to/googler -w torrentz2.eu}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@to @to
function _alias_completion::@tpb {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w thepiratebay.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@tpb/googler -w thepiratebay.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@tpb @tpb
function _alias_completion::@tunein {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w tunein.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@tunein/googler -w tunein.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@tunein @tunein
function _alias_completion::@tw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w twitter.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@tw/googler -w twitter.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@tw @tw
function _alias_completion::@twitch {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w twitch.tv ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@twitch/googler -w twitch.tv}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@twitch @twitch
function _alias_completion::@ubuntuforums {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w ubuntuforums.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ubuntuforums/googler -w ubuntuforums.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ubuntuforums @ubuntuforums
function _alias_completion::@ubuntupackages {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w packages.ubuntu.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@ubuntupackages/googler -w packages.ubuntu.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@ubuntupackages @ubuntupackages
function _alias_completion::@uwiki {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w wiki.ubuntu.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@uwiki/googler -w wiki.ubuntu.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@uwiki @uwiki
function _alias_completion::@vim {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w vim.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@vim/googler -w vim.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@vim @vim
function _alias_completion::@w {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w en.wikipedia.org ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@w/googler -w en.wikipedia.org}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@w @w
function _alias_completion::@walmart {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w walmart.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@walmart/googler -w walmart.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@walmart @walmart
function _alias_completion::@weather {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w weather.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@weather/googler -w weather.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@weather @weather
function _alias_completion::@wikia {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w wikia.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@wikia/googler -w wikia.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@wikia @wikia
function _alias_completion::@xkcd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w xkcd.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@xkcd/googler -w xkcd.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@xkcd @xkcd
function _alias_completion::@y {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w yahoo.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@y/googler -w yahoo.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@y @y
function _alias_completion::@yf {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w finance.yahoo.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@yf/googler -w finance.yahoo.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@yf @yf
function _alias_completion::@yt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w youtube.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@yt/googler -w youtube.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@yt @yt
function _alias_completion::@zdnet {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(googler -w zdnet.com ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/@zdnet/googler -w zdnet.com}
                (( COMP_POINT += ${#COMP_LINE} ))
                _googler
            }
complete -F _alias_completion::@zdnet @zdnet
function _alias_completion::ai {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(apt-get -yqm install ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/ai/apt-get -yqm install}
                (( COMP_POINT += ${#COMP_LINE} ))
                _apt_get
            }
complete -F _alias_completion::ai ai
function _alias_completion::cdsize {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(du -sh ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/cdsize/du -sh}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -F _alias_completion::cdsize cdsize
function _alias_completion::cho {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(sudo chown -R nxa06680:nxa06680 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/cho/sudo chown -R nxa06680:nxa06680}
                (( COMP_POINT += ${#COMP_LINE} ))
                _sudo
            }
complete -F _alias_completion::cho cho
function _alias_completion::chx {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(chmod +x ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/chx/chmod +x}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -F _alias_completion::chx chx
complete -F _minimal clangd
function _alias_completion::clean_tmp {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(rm -rf /tmp/tmp.* ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/clean_tmp/rm -rf /tmp/tmp.*}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -F _alias_completion::clean_tmp clean_tmp
complete -F _minimal d2u
complete -F _alias_completion::egrep egrep
complete -F _alias_completion::fgrep fgrep
function _alias_completion::fsw {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(find . -name *.swp ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/fsw/find . -name *.swp}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -F _alias_completion::fsw fsw
function _alias_completion::g {
                (( COMP_CWORD += 7 ))
                COMP_WORDS=(BROWSER=w3m googler -n 7 -c en -l en ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/g/BROWSER=w3m googler -n 7 -c en -l en}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::g g
 genhelp
function _alias_completion::getsource {
                (( COMP_CWORD += 4 ))
                COMP_WORDS=(tar --exclude=./.git -czvf codebase_20210601_214643.tar.gz ./ ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/getsource/tar --exclude=./.git -czvf codebase_20210601_214643.tar.gz ./}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -F _alias_completion::getsource getsource
function _alias_completion::gettimestamp {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(date +%Y%m%d_%H%M%S ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gettimestamp/date +%Y%m%d_%H%M%S}
                (( COMP_POINT += ${#COMP_LINE} ))
                _longopt
            }
complete -F _alias_completion::gettimestamp gettimestamp
function _alias_completion::gettimestampbb {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(date +%Y.%m.%d-%H:%M:%S ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gettimestampbb/date +%Y.%m.%d-%H:%M:%S}
                (( COMP_POINT += ${#COMP_LINE} ))
                _longopt
            }
complete -F _alias_completion::gettimestampbb gettimestampbb
function _alias_completion::gia {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git add ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gia/git add}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gia gia
function _alias_completion::gib {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git branch ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gib/git branch}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gib gib
function _alias_completion::gibD {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git branch -D ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gibD/git branch -D}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gibD gibD
function _alias_completion::gibDa {
                (( COMP_CWORD += 7 ))
                COMP_WORDS=(git branch -D $(git branch |grep -v "^*") ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gibDa/git branch -D $(git branch |grep -v "^*")}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gibDa gibDa
function _alias_completion::giba {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git branch -a ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/giba/git branch -a}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::giba giba
function _alias_completion::gibd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git branch -d ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gibd/git branch -d}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gibd gibd
function _alias_completion::gibda {
                (( COMP_CWORD += 7 ))
                COMP_WORDS=(git branch -d $(git branch |grep -v "^*") ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gibda/git branch -d $(git branch |grep -v "^*")}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gibda gibda
function _alias_completion::gicb {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git checkout -b ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gicb/git checkout -b}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gicb gicb
function _alias_completion::gich {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git checkout ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gich/git checkout}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gich gich
function _alias_completion::gico {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git commit -s ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gico/git commit -s}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gico gico
function _alias_completion::gigb {
                (( COMP_CWORD += 13 ))
                COMP_WORDS=(git log --all --graph --decorate --oneline --simplify-by-decoration --pretty=format:"%C(auto)%h%d%Creset %C(italic #8f8f8f)(%ci)%Creset %C(italic #8f8f00)%cn <%ce>%Creset%n     %s%n" ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gigb/git log --all --graph --decorate --oneline --simplify-by-decoration --pretty=format:"%C(auto)%h%d%Creset %C(italic #8f8f8f)(%ci)%Creset %C(italic #8f8f00)%cn <%ce>%Creset%n     %s%n"}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gigb gigb
function _alias_completion::gigl {
                (( COMP_CWORD += 12 ))
                COMP_WORDS=(git log --all --graph --decorate --oneline --pretty=format:"%C(auto)%h%d%Creset %C(italic #8f8f8f)(%ci)%Creset %C(italic #8f8f00)%cn <%ce>%Creset%n     %s%n" ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gigl/git log --all --graph --decorate --oneline --pretty=format:"%C(auto)%h%d%Creset %C(italic #8f8f8f)(%ci)%Creset %C(italic #8f8f00)%cn <%ce>%Creset%n     %s%n"}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gigl gigl
function _alias_completion::gigo {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git checkout --ours ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gigo/git checkout --ours}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gigo gigo
function _alias_completion::gigt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git checkout --theirs ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gigt/git checkout --theirs}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gigt gigt
function _alias_completion::gil {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git log ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gil/git log}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gil gil
function _alias_completion::gilo {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git log --oneline ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gilo/git log --oneline}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gilo gilo
function _alias_completion::gilobc {
                (( COMP_CWORD += 7 ))
                COMP_WORDS=(git log --all --graph --decorate --oneline --simplify-by-decoration --date=short ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gilobc/git log --all --graph --decorate --oneline --simplify-by-decoration --date=short}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gilobc gilobc
function _alias_completion::gilobi {
                (( COMP_CWORD += 4 ))
                COMP_WORDS=(git log --oneline --graph --decorate ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gilobi/git log --oneline --graph --decorate}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gilobi gilobi
function _alias_completion::gilod {
                (( COMP_CWORD += 7 ))
                COMP_WORDS=(git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%ci)%Creset %C(green)%cn <%ce>%Creset%n     %s" ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gilod/git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%ci)%Creset %C(green)%cn <%ce>%Creset%n     %s"}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gilod gilod
function _alias_completion::gilol {
                (( COMP_CWORD += 7 ))
                COMP_WORDS=(git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %C(green)%cn <%ce>%Creset%n     %s" ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gilol/git log --graph --pretty=format:"%C(auto)%h%d%Creset %C(cyan)(%cr)%Creset %C(green)%cn <%ce>%Creset%n     %s"}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gilol gilol
function _alias_completion::gip {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git pull ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gip/git pull}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gip gip
function _alias_completion::gipa {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git pull --all ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gipa/git pull --all}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gipa gipa
function _alias_completion::gir {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git rebase ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gir/git rebase}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gir gir
function _alias_completion::gira {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git rebase --abort ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gira/git rebase --abort}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gira gira
function _alias_completion::girc {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git rebase --continue ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/girc/git rebase --continue}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::girc girc
function _alias_completion::girs {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(git rebase --skip ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/girs/git rebase --skip}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::girs girs
function _alias_completion::gis {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(git status ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/gis/git status}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -o nospace -F _alias_completion::gis gis
complete -F _alias_completion::grep grep
complete -F _alias_completion::ls l
complete -F _alias_completion::ls la
complete -F _alias_completion::ls ll
complete -F _alias_completion::ls ls
complete -F _alias_completion::ls lv
complete -F _minimal make
complete -F _alias_completion::grep mygrep
complete -o bashdefault -o default -F _fzf_path_completion nv
function _alias_completion::ovim {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(TERM=xterm-256color /usr/bin/vim ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/ovim/TERM=xterm-256color /usr/bin/vim}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::ovim ovim
function _alias_completion::sai {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(sudo apt-get -yqm install ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/sai/sudo apt-get -yqm install}
                (( COMP_POINT += ${#COMP_LINE} ))
                _sudo
            }
complete -F _alias_completion::sai sai
function _alias_completion::sshH1 {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(ssh user@10.232.90.247 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/sshH1/ssh user@10.232.90.247}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_host_completion
            }
complete -o bashdefault -o default -F _alias_completion::sshH1 sshH1
complete -o nospace -F _task t
function _alias_completion::ta {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task add ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/ta/task add}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::ta ta
function _alias_completion::taPersonal {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:Personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/taPersonal/task add project:Personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::taPersonal taPersonal
function _alias_completion::taWork.fr1 {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:Work.fr1 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/taWork.fr1/task add project:Work.fr1}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::taWork.fr1 taWork.fr1
function _alias_completion::taWork.nlm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:Work.nlm ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/taWork.nlm/task add project:Work.nlm}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::taWork.nlm taWork.nlm
function _alias_completion::taWork.sbrask {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:Work.sbrask ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/taWork.sbrask/task add project:Work.sbrask}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::taWork.sbrask taWork.sbrask
function _alias_completion::tac {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task active ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tac/task active}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tac tac
function _alias_completion::tadevenv {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:devenv ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tadevenv/task add project:devenv}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tadevenv tadevenv
function _alias_completion::tadummy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:dummy ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tadummy/task add project:dummy}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tadummy tadummy
function _alias_completion::tan {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task annotate ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tan/task annotate}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tan tan
function _alias_completion::tap {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:Personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tap/task add project:Personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tap tap
function _alias_completion::taw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task add project:Work ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/taw/task add project:Work}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::taw taw
function _alias_completion::tbdd {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task burndown.daily ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tbdd/task burndown.daily}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tbdd tbdd
function _alias_completion::tbdw {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task burndown.weekly ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tbdw/task burndown.weekly}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tbdw tbdw
function _alias_completion::tbdy {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task burndown.yearly ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tbdy/task burndown.yearly}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tbdy tbdy
function _alias_completion::td {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task done ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/td/task done}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::td td
function _alias_completion::tdPersonal {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task done project:Personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tdPersonal/task done project:Personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tdPersonal tdPersonal
function _alias_completion::tdWork.fr1 {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task done project:Work.fr1 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tdWork.fr1/task done project:Work.fr1}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tdWork.fr1 tdWork.fr1
function _alias_completion::tdWork.nlm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task done project:Work.nlm ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tdWork.nlm/task done project:Work.nlm}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tdWork.nlm tdWork.nlm
function _alias_completion::tdWork.sbrask {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task done project:Work.sbrask ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tdWork.sbrask/task done project:Work.sbrask}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tdWork.sbrask tdWork.sbrask
function _alias_completion::tddevenv {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task done project:devenv ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tddevenv/task done project:devenv}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tddevenv tddevenv
function _alias_completion::tddummy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task done project:dummy ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tddummy/task done project:dummy}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tddummy tddummy
function _alias_completion::tey {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task end.after:yesterday completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tey/task end.after:yesterday completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tey tey
function _alias_completion::tftpsrv {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(ssh nxa06680@10.232.90.101 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tftpsrv/ssh nxa06680@10.232.90.101}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_host_completion
            }
complete -o bashdefault -o default -F _alias_completion::tftpsrv tftpsrv
function _alias_completion::tl {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task log ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tl/task log}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tl tl
function _alias_completion::tlPersonal {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task log project:Personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tlPersonal/task log project:Personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tlPersonal tlPersonal
function _alias_completion::tlWork.fr1 {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task log project:Work.fr1 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tlWork.fr1/task log project:Work.fr1}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tlWork.fr1 tlWork.fr1
function _alias_completion::tlWork.nlm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task log project:Work.nlm ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tlWork.nlm/task log project:Work.nlm}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tlWork.nlm tlWork.nlm
function _alias_completion::tlWork.sbrask {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task log project:Work.sbrask ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tlWork.sbrask/task log project:Work.sbrask}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tlWork.sbrask tlWork.sbrask
function _alias_completion::tldevenv {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task log project:devenv ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tldevenv/task log project:devenv}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tldevenv tldevenv
function _alias_completion::tldummy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task log project:dummy ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tldummy/task log project:dummy}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tldummy tldummy
function _alias_completion::tlw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task end.after:today-1wk completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tlw/task end.after:today-1wk completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tlw tlw
complete -F _alias_completion::tmux tma
complete -F _alias_completion::tmux tmks
complete -F _alias_completion::tmux tml
function _alias_completion::tmux {
                (( COMP_CWORD += 4 ))
                COMP_WORDS=(EDITOR=nvim TERM=tmux-256color tmux -2 -u ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tmux/EDITOR=nvim TERM=tmux-256color tmux -2 -u}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::tmux tmux
function _alias_completion::tn {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task next +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tn/task next +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tn tn
function _alias_completion::tnPersonal {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(task next project:Personal +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tnPersonal/task next project:Personal +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tnPersonal tnPersonal
function _alias_completion::tnWork.fr1 {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(task next project:Work.fr1 +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tnWork.fr1/task next project:Work.fr1 +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tnWork.fr1 tnWork.fr1
function _alias_completion::tnWork.nlm {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(task next project:Work.nlm +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tnWork.nlm/task next project:Work.nlm +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tnWork.nlm tnWork.nlm
function _alias_completion::tnWork.sbrask {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(task next project:Work.sbrask +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tnWork.sbrask/task next project:Work.sbrask +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tnWork.sbrask tnWork.sbrask
function _alias_completion::tndevenv {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(task next project:devenv +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tndevenv/task next project:devenv +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tndevenv tndevenv
function _alias_completion::tndummy {
                (( COMP_CWORD += 3 ))
                COMP_WORDS=(task next project:dummy +READY ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tndummy/task next project:dummy +READY}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tndummy tndummy
function _alias_completion::tpers {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task context personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tpers/task context personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tpers tpers
function _alias_completion::trm {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task delete ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trm/task delete}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trm trm
function _alias_completion::trmPersonal {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task delete project:Personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trmPersonal/task delete project:Personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trmPersonal trmPersonal
function _alias_completion::trmWork.fr1 {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task delete project:Work.fr1 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trmWork.fr1/task delete project:Work.fr1}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trmWork.fr1 trmWork.fr1
function _alias_completion::trmWork.nlm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task delete project:Work.nlm ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trmWork.nlm/task delete project:Work.nlm}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trmWork.nlm trmWork.nlm
function _alias_completion::trmWork.sbrask {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task delete project:Work.sbrask ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trmWork.sbrask/task delete project:Work.sbrask}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trmWork.sbrask trmWork.sbrask
function _alias_completion::trmdevenv {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task delete project:devenv ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trmdevenv/task delete project:devenv}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trmdevenv trmdevenv
function _alias_completion::trmdummy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task delete project:dummy ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/trmdummy/task delete project:dummy}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::trmdummy trmdummy
function _alias_completion::ts {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task start ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/ts/task start}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::ts ts
function _alias_completion::tt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task modified:today completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tt/task modified:today completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tt tt
function _alias_completion::tts {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(task timesheet ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tts/task timesheet}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::tts tts
function _alias_completion::twc {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(timew continue ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twc/timew continue}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twc twc
function _alias_completion::twd {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew summary :day ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twd/timew summary :day}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twd twd
function _alias_completion::twlw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew summary :lastweek ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twlw/timew summary :lastweek}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twlw twlw
function _alias_completion::twork {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task context work ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twork/task context work}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::twork twork
function _alias_completion::tws {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew summary :week ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/tws/timew summary :week}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::tws tws
function _alias_completion::twst {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(timew start ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twst/timew start}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twst twst
function _alias_completion::twstPersonal {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew start Personal ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstPersonal/timew start Personal}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstPersonal twstPersonal
function _alias_completion::twstWork.fr1 {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew start Work.fr1 ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstWork.fr1/timew start Work.fr1}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstWork.fr1 twstWork.fr1
function _alias_completion::twstWork.nlm {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew start Work.nlm ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstWork.nlm/timew start Work.nlm}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstWork.nlm twstWork.nlm
function _alias_completion::twstWork.sbrask {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew start Work.sbrask ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstWork.sbrask/timew start Work.sbrask}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstWork.sbrask twstWork.sbrask
function _alias_completion::twstdevenv {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew start devenv ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstdevenv/timew start devenv}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstdevenv twstdevenv
function _alias_completion::twstdummy {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(timew start dummy ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstdummy/timew start dummy}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstdummy twstdummy
function _alias_completion::twstop {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(timew stop ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/twstop/timew stop}
                (( COMP_POINT += ${#COMP_LINE} ))
                _timew
            }
complete -F _alias_completion::twstop twstop
function _alias_completion::ty {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(task modified:yesterday completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/ty/task modified:yesterday completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _task
            }
complete -o nospace -F _alias_completion::ty ty
complete -o bashdefault -o default -F _fzf_path_completion v
function _alias_completion::vbash {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(vim ~/.bashrc ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/vbash/vim ~/.bashrc}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -F _alias_completion::vbash vbash
function _alias_completion::vdbash {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(vim ~/devenv/shell/bash/devenv_bashrc ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/vdbash/vim ~/devenv/shell/bash/devenv_bashrc}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -F _alias_completion::vdbash vdbash
complete -o bashdefault -o default -F _fzf_path_completion vim
function _alias_completion::vtm {
                (( COMP_CWORD += 1 ))
                COMP_WORDS=(vim ~/.devenv_tmux.conf ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/vtm/vim ~/.devenv_tmux.conf}
                (( COMP_POINT += ${#COMP_LINE} ))
                _fzf_path_completion
            }
complete -o bashdefault -o default -F _alias_completion::vtm vtm
complete -F _minimal wt
function _alias_completion::wtey {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(wtsl end.after:yesterday completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/wtey/wtsl end.after:yesterday completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::wtey wtey
function _alias_completion::wtlw {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(wtsl end.after:today-1wk completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/wtlw/wtsl end.after:today-1wk completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::wtlw wtlw
function _alias_completion::wtt {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(wtsl modified:today completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/wtt/wtsl modified:today completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::wtt wtt
function _alias_completion::wty {
                (( COMP_CWORD += 2 ))
                COMP_WORDS=(wtsl modified:yesterday completed ${COMP_WORDS[@]:1})
                (( COMP_POINT -= ${#COMP_LINE} ))
                COMP_LINE=${COMP_LINE/wty/wtsl modified:yesterday completed}
                (( COMP_POINT += ${#COMP_LINE} ))
                _minimal
            }
complete -F _alias_completion::wty wty
