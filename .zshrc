# Testing yadm
fpath=($fpath "/home/baj/.zfunctions")

# Home and End keys
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

bindkey "\e[3~" delete-char
bindkey "~5" delete-word

# CTRL supr to delete next word
bindkey '^[[3;5~' kill-word

# CTRL + Arrows to move words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

POWERLEVEL9K_MODE='nerdfont-complete'
source ~/dev/dotfiles/powerlevel9k/powerlevel9k.zsh-theme

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Alias
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lh='ls -lha'
alias ll='exa -lg'
alias lll='exa -lgG'
alias lla='exa -lga'

# Prompts

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true


package_version(){
 local pkgjson=$(pwd)/package.json
 if [[ -f $pkgjson ]]; then
  local pkgver
  local actualpkgver=$(node -p "require('$pkgjson').version || ''") 
  [[ -z $actualpkgver ]] || pkgver=$'\uF487'' '$actualpkgver
  echo -n $pkgver

 fi

}

POWERLEVEL9K_CUSTOM_PACKAGE_VERSION='package_version'
POWERLEVEL9K_CUSTOM_PACKAGE_VERSION_BACKGROUND='239'
POWERLEVEL9K_CUSTOM_PACKAGE_VERSION_FOREGROUND='clear'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status custom_package_version background_jobs todo time)


# added by travis gem
[ -f /home/baj/.travis/travis.sh ] && source /home/baj/.travis/travis.sh
