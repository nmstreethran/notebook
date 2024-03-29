# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/nms/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Keyboard layout
# setxkbmap gb

# Powerlines
# https://wiki.archlinux.org/title/Powerline
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

# Keyboard shortcuts for Zsh
# https://bbs.archlinux.org/viewtopic.php?id=239257
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# Ruby
export GEM_HOME=~/.gem
export GEM_PATH=$GEM_HOME/ruby/3.0.0
export PATH="$GEM_PATH/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nms/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nms/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nms/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nms/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# SSH settings
eval "$(ssh-agent -s)"
ssh-add

# GPG key
export GPG_TTY=$(tty)

# PROJ
export PROJ_LIB=/usr/share/proj

# TeX Live
export MANPATH="/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
