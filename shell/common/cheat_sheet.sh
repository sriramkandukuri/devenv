##BH |cheat|get help on given programing languages or tools using cht.sh + fzf|
# Thank you ThePrimeagen
cheat ()
{
    lang="
golang
nodejs
javascript
typescript
cpp
c
lua
rust
python
bash
php
haskell
ArnoldC
css
html"

    cmd="
find
man
tldr
sed
awk
tr
cp
ls
grep
xargs
rg
ps
mv
kill
lsof
less
head
tail
tar
cp
rm
rename
jq
cat
ssh
cargo
git
git-worktree
git-status
git-commit
git-rebase
docker
docker-compose
stow
chmod
chown
    "
    selected=`echo "$lang $cmd" | fzf`
    read -p "Enter Query: " query

    if grep -qs "$selected" <<< "$lang"; then
        query=`echo $query | tr ' ' '+'`
        curl cht.sh/$selected/$query
    elif grep -qs "$selected" <<< "$cmd"; then
        curl -s cht.sh/$selected~$query
    fi
}

##BH |tmch|Same as cheat command but opens in new tmux window and closes with Ctrl-C|
tmch()
{
    tmux neww bash -ic "cheat ; while true;do sleep 1;done"
}
