pyenvit()
{
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
    pyenv global 3.8.5
}
