##BH |csd|Open cscope with available cscope files in current directory|
alias csd='export VIM_CSF_DIRS=$VIM_CSF_DIRS_BAK;CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kd;export VIM_CSF_DIRS=""'
#alias cscope='find . \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) > cscope.files; ctags --exclude=*/.pc/* --exclude=*.patch -R .;CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files'
#alias cscopef='rm -rf tags;rm -rf ./cscope.out;ctags -R .;CSCOPE_EDITOR=vim VIEWER=vim cscope -p4 -kR'
##BH |cs|Create cscope db and open cscope. This also takes directories as arguments to which cscopedb need to be created.|

cs ()
{
    printf "%s\n" "-ferror-limit=0" > compile_flags.txt
    if [ "$#" != "0" ]
    then
        export VIM_CSF_DIRS="$@"
    else
        export VIM_CSF_DIRS="$PWD"
    fi
    $(gcc -print-prog-name=cc1) -v /dev/null -o /dev/null 2>&1 | grep include | grep -v "^#" | grep -v "ignoring" | sed -e 's/^ /-I\n/g' >> compile_flags.txt
    printf "%s\n%s\n%s\n%s\n%s\n" "%h" "-I" "./" "-I" "../" >> compile_flags.txt
    if [ $# == 0 ];then
        find . \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.py" \) > cscope.files && \
        find . -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | xargs dirname | awk '!x[$0]++' | sed -e 's/^/-I\n/g' >> compile_flags.txt && \
        find . -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | awk '!x[$0]++' | sed -e 's/^/-I\n/g' >> compile_flags.txt && \
        ctags --exclude=*/.pc/* --exclude=*.patch -R . && \
        CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files;
    else
        find $@ \( ! -path "*/.pc/*" -a ! -path "*.patch" \) -a \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.py" \) > cscope.files && \
        find $@ -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | xargs dirname | sort -u | sed -e 's/^/-I/g' >> compile_flags.txt && \
        find $@ -name "*.h" -o -name "*.hpp" -o -name "*.H"  | xargs dirname | sort -u | sed -e 's/^/-I/g' >> compile_flags.txt && \
        ctags --exclude=*/.pc/* --exclude=*.patch -R $@ && \
        CSCOPE_EDITOR=nvim VIEWER=nvim cscope -p4 -kR -i cscope.files;
    fi
    export VIM_CSF_DIRS_BAK=$VIM_CSF_DIRS
    export VIM_CSF_DIRS=""
}
##BH |csf|Similar to above `cs` but removes all the cscope db files before creating new set of files. This can used to refresh the db if source is changed.|
csf ()
{
    rm -rf $(find $@ -name "cscope.out" -o -name "tags" -o -name "compile_flags.txt" -o -name "cscope.files" -o -name "ccls-cache")
    cs $@
}

