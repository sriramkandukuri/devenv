##BH |getsymbolo|Debugging helper find any symbol from compile .o files in any subdirectory.|
getsymbolo ()
{
    echo;
    for i in $(find . -name *.o);
    do
        nm $i |grep -w --color $1;
        if [ "$?" = 0 ];
        then
            echo $i;
            echo;
        fi;
    done
}

