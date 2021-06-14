# Devenv

Customized Development environment for linux

1. bashrc [bashhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/bashhelp.md)
2. tmux [tmuxhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/tmuxhelp.md)
3. vimrc [vimhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/vimhelp.md)

### Installation

Clone this repo to your home directory on any linux host.

#### Prerequisite for Ubuntu 18-04

Install nodejs version 10 as mentioned in https://joshtronic.com/2018/05/08/how-to-install-nodejs-10-on-ubuntu-1804-lts/

#### Installation

Use `./install.sh help` for instructions.

To install everything use `./install.sh all`

Add below line to your bashrc

```
source ~/devenv/shell/bash/devenv_bashrc
```

If powerline fonts are not supported add below lines to bashrc instead of above step.

```
source ~/devenv/shell/bash/devenv_bashrc
export USE_PWR_FONTS=0
```

Reload your shell or start working on new shell.

Main help commands `bhelp <keyword>` `vhelp <keyword>` `tmhelp <keyword>`

### Terminal

[Secure Shell App](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo?hl=en) a Chrome application which works very smooth.

- Fonts that work better
  - Right now only DejavuSansMono Nerd font working good with all kinds of icons and gylphs
  - [Nerd fonts collection](https://github.com/ryanoasis/nerd-fonts)

For best experience with arrow keys or powerline symbols its suggested to install patched fonts.

Recently switched to Chrome application mentioned above. Due to bugs with key mapping in terminus.
[Terminus](https://eugeny.github.io/terminus/) on windows with Dracula color theme. This has some minor issues.

- [Key mapping](https://github.com/Eugeny/terminus/issues/2328)
- [Is there a way to disable Shift+PageUp](https://github.com/Eugeny/terminus/issues/2396)

### Vim

Please refer to [vimhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/vimhelp.md) for available custom shortcuts in addition to original vim/nvim keyboard shortcuts

#### Usefull cheat sheets

- [Vimdiff cheat sheet and shortcuts](https://gist.github.com/mattratleph/4026987)

### Tmux

- Using Tmux config from [gpakosz](https://github.com/gpakosz/.tmux.git)
- Customized config from (tmux/tmux.conf)

Refer to [tmuxhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/tmuxhelp.md) for available custom shortcuts.

### Bashrc

Fully customised bashrc with better prompt line and several helper functions.
Refer to [bashhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/bashhelp.md) for all shortcuts available.

#### Note

> Tested only with terminus and chrome secure shell on windows with ubuntu 20.04 remote server.
> Please report issue if you face any

### Contribution

Main goal is to use single script to get all the development environment on any linux server.

> You are welcome for contributions

#### Collection of all cheat sheets

- [Cheat sheets collection](https://github.com/LeCoupa/awesome-cheatsheets)
