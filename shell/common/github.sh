##BH |gh_rel|Get latest github release file from a repo `Usage gh_rel <repo name> <file regex pattern>`|
gh_rel()
{
    [ "$1" == "" -o "$2" == "" ] && echo "Usage gh_rel <repo name> <file regex pattern>" && return
    repo=$1
    file_pattern=$2
    curl -s https://api.github.com/repos/$repo/releases/latest | grep browser_download_url|cut -d: -f2-|grep -E "$file_pattern"|sed -e 's/\"//g' -e 's/^ //g'
}

