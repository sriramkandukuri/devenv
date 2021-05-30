##BH |create_pkeys|create ssh keys for automatic ssh logins.|
create_pkeys()
{
    cd ~;
    ssh-keygen -t rsa
    cd -
}
##BH |setup_ssh|Auto ssh login helper which set sshkeys to remote server, ex. `setup_ssh user@host`|
setup_ssh()
{
    if [ ! -f ~/.ssh/id_rsa.pub ]
    then
        create_pkeys
    fi
    cd ~;
    ssh $@ mkdir -p .ssh
    cat .ssh/id_rsa.pub | ssh $@ 'cat >> .ssh/authorized_keys'
    ssh $@ "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
    cd -
}


