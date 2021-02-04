# Devenv

Script based Development environment for remote servers.

1. bashrc
2. tmux
3. vimrc

### Installation

Clone this repo to your home directory on any linux host.

#### Prerequisite for Ubuntu 18-04

Install nodejs version 10 as mentioned in https://joshtronic.com/2018/05/08/how-to-install-nodejs-10-on-ubuntu-1804-lts/

#### Installation

Verbose to dump all logs to console

```
./install.sh all -v
```

Non verbose mode

```
./install.sh all
```

Add below line to your bashrc

```
source ~/devenv/bashrc
```

If powerline fonts are not supported add below lines to bashrc instead of above step.

```
source ~/devenv/bashrc
export USE_PWR_FONTS=0
```

Reload your shell or start working on new shell.

Main help commands `bhelp <keyword>` `vhelp <keyword>` `tmhelp <keyword>`

### Terminal

[Secure Shell App](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo?hl=en) a Chrome application which works very smooth.

- Fonts that work fine with my setup.
  - [Source Code Pro Medium Regular](https://github.com/adobe-fonts/source-code-pro/releases/tag/2.030R-ro/1.050R-it) font woks fine.
  - Ubuntu Mono Regular
  - [Hack Regular](https://github.com/powerline/fonts/tree/master/Hack)
  - [Nerd fonts collection](https://github.com/ryanoasis/nerd-fonts)

For best experience with arrow keys or powerline symbols its suggested to install patched fonts.

Recently switched to Chrome application mentioned above. Due to bugs with key mapping in terminus.
[Terminus](https://eugeny.github.io/terminus/) on windows with Dracula color theme. This has some minor issues.

- [Key mapping](https://github.com/Eugeny/terminus/issues/2328)
- [Is there a way to disable Shift+PageUp](https://github.com/Eugeny/terminus/issues/2396)

### Vim

Please refer to [vimhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/vimhelp.md) for available custom shortcuts in addition to original vim/nvim keyboard shortcuts

#### Usefull cheat sheets

- [Vimdiff cheat sheet and shortcuts](https://gist.github.com/mattratleph/4026987)

### Tmux

- Using Tmux config from [gpakosz](https://github.com/gpakosz/.tmux.git)
- Customized config from (mytmux.conf)

Refer to [tmuxhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/tmuxhelp.md) for available custom shortcuts.

### Bashrc

Fully customised bashrc with beautiful prompt line and several helper functions.
Refer to [bashhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/bashhelp.md) for all shortcuts available.

### Default programs

Below programs get installed by default

- cscope
- ctags
- python and python3
- powerline fonts
- bash-completion
- ripgrep - For vim plugin
- tmux
- vim 8+
- node js for coc plugin
- etc...

#### Note

> Tested only with terminus and chrome secure shell on windows with ubuntu 16.04 remote server.
> Please report issue if you face issue with same setup.

### Contribution

Main goal is to use single script to get all the development environment on any linux server.

> You are welcome for contributions

### Other files

- Dracula color scheme for any terminal
  - `Dracula.colorscheme`
- Helper script for printing color pallette
  - `colors.sh`

### TODO

- Bash completion for several programs used often.
