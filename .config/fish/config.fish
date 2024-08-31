if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    pokeget --hide-name random
end

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

# History configuration
set -U fish_history_file ~/.config/fish/fish_history
set -U fish_history_size 10000

# Disable beep on error
set -U fish_beep "false"

# Set JAVA_HOME
set -gx JAVA_HOME /opt/jdk-20.0.2
set -gx PATH $JAVA_HOME/bin $PATH

# Keybindings
bind \e\[3~ delete-char        # Bind delete key
bind \e\[1\;5C forward-word    # Bind ctrl+right arrow to move forward a word
bind \e\[1\;5D backward-word   # Bind ctrl+left arrow to move backward a word
bind \e\[1~ beginning-of-line  # Home key
bind \e\[4~ end-of-line        # End key
bind \b backward-kill-word     # Ctrl + Backspace

# Alias configuration
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
alias catp='bat --paging=never --plain'
alias icat='kitten icat'
alias cls='clear'
alias pSyu='sudo pacman -Syu'
alias pS='sudo pacman -S'
alias pR='sudo pacman -R'
alias ySyu='yay -Syu'
alias yS='yay -S'
alias yR='yay -R'
alias gits='git status'
alias gita='git add'
alias gitc='git commit -m'
alias gitca='git commit -am'
alias gitkey='cat $HOME/Dropbox/keys/github_key.md | wl-copy'

# Bun completions
if test -s "/home/ranicocs/.bun/_bun"
    source "/home/ranicocs/.bun/_bun"
end
