# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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
export GEM_PATH=$GEM_HOME/ruby/2.7.0
export PATH="$GEM_PATH/bin:$PATH"

# SSH
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket
