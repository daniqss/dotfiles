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
zstyle :compinstall filename '/home/daniqss/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

# transcient prompt
zle-line-init() {
   emulate -L zsh

   [[ $CONTEXT == start ]] || return 0

   while true; do
     zle .recursive-edit
     local -i ret=$?
     [[ $ret == 0 && $KEYS == $'\4' ]] || break
     [[ -o ignore_eof ]] || exit 0
   done

   local saved_prompt=$PROMPT
   local saved_rprompt=$RPROMPT
   print -r -- ""
   PROMPT='$(starship module character)'
   RPROMPT=''
   zle .reset-prompt
   PROMPT=$saved_prompt
   RPROMPT=$saved_rprompt

   if (( ret )); then
     zle .send-break
   else
     zle .accept-line
   fi
   return ret
 }

zle -N zle-line-init

export PATH="/usr/local/mysql/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk/

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line
bindkey "^H" backward-kill-word
bindkey "\e\r" forward-char


# eval "pokeget random --hide-name"
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
alias catp='bat --paging=never --plain'
alias icat='kitten icat'
alias cls='clear'
code() {
	/usr/bin/code "$@" > /dev/null 2>&1
}
intellij() {
	/opt/intellij-idea-ultimate-edition/bin/idea.sh "$@" > /dev/null 2>&1 & disown
}
android-studio() {
	/opt/android-studio/bin/studio "$@" > /dev/null 2>&1 & disown
}
alias lsi='TERM=xterm-256color ssh -i ~/.ssh/lsi_maquina lsi@10.11.48.180'
alias mysql='mariadb'
alias mysqladmin='mariadb-admin'

alias pSyu='sudo pacman -Syu'
alias pS='sudo pacman -S'
alias pR='sudo pacman -Rs'
alias ySyu='yay -Syu'
alias yS='yay -S'
alias yR='yay -Rs'

alias gits='git status'
alias gita='git add'
alias gitc='git commit -m'
alias gitca='git commit -am'
alias gitgraph="git log --graph --decorate --all --pretty=format:'%C(auto)%h%d %C(#888888)(%an; %ar)%Creset %s'"

# alias dotfiles='/usr/bin/git --git-dir=$HOME/git-bare/dotfiles/ --work-tree=$HOME/.config'
# alias FIC='/usr/bin/git --git-dir=$HOME/git-bare/FIC --work-tree=$HOME/Dropbox/Obsidian/FIC'
# alias dotfiles-add='dotfiles add alacritty dun'


plugins=(
  "$HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "$HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "$HOME/.config/zsh/sudo.plugin.zsh"
)
for file in $plugins; do
  if [[ -f $file ]]; then
    source $file
  fi
done

# bun completions
[ -s "/home/ranicocs/.bun/_bun" ] && source "/home/ranicocs/.bun/_bun"
