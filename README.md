# Devenv

Customized Development environment for linux

1. shell (bash and zsh) [bashhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/bashhelp.md)
2. tmux [tmuxhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/tmuxhelp.md)
3. vim/nvim [vimhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/vimhelp.md)
4. Some default tools and packages for developers

## Installation

Clone this repo to your home directory on any linux host.

### Prerequisite for Ubuntu 18-04

Install nodejs version 10 as mentioned in https://joshtronic.com/2018/05/08/how-to-install-nodejs-10-on-ubuntu-1804-lts/

### Installation

Use `./install.sh help` for instructions.

To install everything use `./install.sh all`

If powerline fonts are not supported add below lines to bashrc instead of above step.

```
export USE_PWR_FONTS=0
```

Reload your shell or start new shell.

Main help commands `bhelp <keyword>` `vhelp <keyword>` `tmhelp <keyword>`

## Vim

Please refer to [vimhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/vimhelp.md) for available custom shortcuts in addition to original vim/nvim keyboard shortcuts

#### Usefull cheat sheets

- [Vimdiff cheat sheet and shortcuts](https://gist.github.com/mattratleph/4026987)

## Tmux

- Using Tmux config from [gpakosz](https://github.com/gpakosz/.tmux.git)
- Customized config from (tmux/tmux.conf)

Refer to [tmuxhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/tmuxhelp.md) for available custom shortcuts.

## Bashrc

Fully customised bashrc with better prompt line and several helper functions.
Refer to [bashhelp.md](https://github.com/sriramkandukuri/devenv/blob/master/help/bashhelp.md) for all shortcuts available.

## Terminal

Working terminal emulators on Windows

[Git bash](https://git-scm.com/downloads)

[Secure Shell App](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo?hl=en) a Chrome application which works very smooth.

- Unwanted horizontal lines in tmux

[Terminus](https://eugeny.github.io/terminus/) on windows with Dracula color theme. This has some minor issues.

- Very slow xterm
- xterm-gl not working with all colors
- [Key mapping](https://github.com/Eugeny/terminus/issues/2328)
- [Is there a way to disable Shift+PageUp](https://github.com/Eugeny/terminus/issues/2396)

> For linux any terminal emulator should work

#### Fonts

For best experience with icons its suggested to install patched fonts.

  - Collection of such fonts can be found from [Nerd fonts collection](https://github.com/ryanoasis/nerd-fonts)

#### Note

> Tested with terminus, gitbash and chrome secure shell on windows with ubuntu (20.04 and 21.10)  remote server.
> Please report issue if you face any

## Contribution

Goal is to use single script maintain all the development environment on any linux host

> You are welcome for contributions

## Other resources

- [Cheat sheets collection](https://github.com/LeCoupa/awesome-cheatsheets)
