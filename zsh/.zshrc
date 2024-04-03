# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch
unsetopt notify
# bindkey -v
set noci
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ranicocs/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH="$HOME/.cargo/bin/:$HOME/.config/scripts:$PATH"
export JAVA_HOME=/opt/jdk-20.0.2
export PATH=$JAVA_HOME/bin:$PATH
export WEZTERM_CONFIG_FILE="$HOME/.config/wezterm/wezterm.lua"


bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line
bindkey '^H' backward-kill-word

eval "pokeget random --hide-name"
eval "$(starship init zsh)"

alias ls='exa --icons'
alias la='exa --icons -a'
alias ll='exa --header --icons --git -t=mod --time-style=long-iso -l'
alias lla='exa --header --icons --git -t=mod --time-style=long-iso -la'
alias ts='exa --tree --level=2'
alias tsa='exa --tree --level=2'
alias tl='exa --tree --level=2 --header --icons -t=mod --time-style=long-iso -l'
alias tla='exa --tree --level=2 --header --icons -t=mod --time-style=long-iso -la'
alias treee='exa --tree --icons'
alias grep='grep --color=auto'
alias cat='bat --paging=never'
alias icat='kitten icat'
alias cls='clear'
alias pSyu='sudo pacman -Syu'
alias pS='sudo pacman -S'
alias pR='sudo pacman -R'
alias ySyu='yay -Syu'
alias yS='yay -S'
alias yR='yay -R'

alias dotfiles='/usr/bin/git --git-dir=$HOME/git-bare/dotfiles/ --work-tree=$HOME/.config'
alias FIC='/usr/bin/git --git-dir=$HOME/git-bare/FIC --work-tree=$HOME/Dropbox/Obsidian/FIC'
# alias dotfiles-add='dotfiles add alacritty dun'
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-shift-select/zsh-shift-select.plugin.zsh

# bun completions
[ -s "/home/ranicocs/.bun/_bun" ] && source "/home/ranicocs/.bun/_bun"
