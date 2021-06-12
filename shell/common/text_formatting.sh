##### 24bit/16M RGB color helpers

##BH |printcolors|Test terminal supports 256 colors or not. Also outputs color numbers.|
printcolors()
{
    for i in {0..255} ; do
        printf "\e[38;5;${i}mcolour${i}\n"
    done
}

##BH |rgbtest|Test your terminal supports rgb colors or not and print them|
rgbtest()
{
	awk 'BEGIN{
	s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
	for (colnum = 0; colnum<77; colnum++) {
		r = 255-(colnum*255/76);
		g = (colnum*510/76);
		b = (colnum*255/76);
		if (g>255) g = 510-g;
			printf "\033[48;2;%d;%d;%dm", r,g,b;
			printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
			printf "%s\033[0m", substr(s,colnum+1,1);
		}
		printf "\n";
	}'
}

##BH |-|Function naming as (t)(clr)(t)(b) --> (true)(color)(text)(bold)|
##BH |-|tclrtb, tclrt. tclrbg are single argument functions which take one color code|
##BH |-|tclr and tclrb takes two arguments first one background and second one foreground|
##BH |-|tclre ends color coding. **All color codes to be given in hex format**|

##BH |tclrtb|Color only foreground and set text to bold|
tclrtb ()
{
    x="0x$1"
    printf "\e[1;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

##BH |tclrt|Color only foreground|
tclrt ()
{
    x="0x$1"
    printf "\e[38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

##BH |tclrbg|Color only background|
tclrbg ()
{
    x="0x$1"
    printf "\e[48;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff))
}

##BH |tclrb|Color background and foreground and make text to bold|
tclrb ()
{
    x="0x$1"
    y="0x$2"
    printf "\e[48;2;%d;%d;%d;1;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}

##BH |tclrb|Color background and foreground.|
tclr ()
{
    x="0x$1"
    y="0x$2"
    printf "\e[48;2;%d;%d;%d;38;2;%d;%d;%dm" $(( $((x & 0xff0000)) >> 16 )) $(( $((x & 0x00ff00)) >> 8 )) $((x & 0x0000ff)) $(( $((y & 0xff0000)) >> 16  )) $(( $((y & 0x00ff00)) >> 8  )) $((y & 0x0000ff))
}

##BH |tclre|Ends color coding.|
tclre()
{
    printf "\e[0m"
}
##BH |print_u8charset|Print whole UTF-8 char set. Not working correctly as there are several unwanted characters|
print_u8charset ()
{
    count=0
    for i in {0..255}
    do
        for j in {0..255}
        do
            for k in {0..255}
            do
                x=$(printf "\\\x%02X\\\x%02X\\\x%02X" $i $j $k)
                printf "%s( $x )" $x
                count=`expr $count + 1`
                if [ $count = 100 ]
                then
                    count=0
                    echo
                fi
            done
        done
    done
}

##BH |rtxt|print given arguments right aligned|
rtxt ()
{
    local str="$@"
    printf "%*s" $((($COLUMNS))) "$str"
}

##BH |ctxt|print given arguments center aligned|
ctxt ()
{
    local str="$@"
    printf "%*s%*s" $(((${#str}+$COLUMNS)/2)) "$str"
}
##BH |ctxtf|print given arguments center aligned with trailing spaces(f)|
ctxtf ()
{
    local str="$@"
    printf "%*s%*s" $(((${#str}+$COLUMNS)/2)) "$str" $((($COLUMNS-${#str}+1)/2)) " "
}
##BH |drawline|print horizontal line useful for screen seperation in some scripts|
drawline ()
{
    # printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' \U2015
    cols=$(tput cols)
    printf "\U2015"'%.s' $(eval "echo {1.."$(($cols))"}")
}

