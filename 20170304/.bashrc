if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# imagemagic インストール用
export PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick/7.0.4-10/lib/pkgconfig/
PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.7-9/lib/pkgconfig/

# ターミナル色付け
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
if type -P dircolors >/dev/null ; then
  eval `dircolors $HOME/.dir_colors`
fi

alias g="git"
alias ls='gls -AFh --color' # 色付け
alias ll='gls -slhAF --color' 
