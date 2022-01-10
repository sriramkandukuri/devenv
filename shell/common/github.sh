##BH |gh_rel|Get latest github release file from a repo `Usage gh_rel <repo name> <file regex pattern>`|
gh_rel()
{
    [ "$1" = "" ] && echo "Usage gh_rel <repo name> [file regex pattern]" && return
    repo=$1
    if [ -n "$2" ];then
        echo "second arg"
        file_pattern=$2
        curl -s https://api.github.com/repos/$repo/releases/latest | grep browser_download_url|cut -d: -f2-|grep -E "$file_pattern"|sed -e 's/\"//g' -e 's/^ //g'
    else
        echo "no second arg"
        curl -s https://api.github.com/repos/$repo/releases/latest | grep browser_download_url|cut -d: -f2-|sed -e 's/\"//g' -e 's/^ //g'
    fi
}

##BH |ghkey|copy github key to clipboard one should add their github key to ~/.ghkey file|
ghkey()
{
    if [ -f ~/.ghkey ];then
        cat ~/.ghkey|xsel
    fi
}
