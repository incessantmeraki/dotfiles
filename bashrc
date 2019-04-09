
#Setup for base-16
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"    

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History management
export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTIGNORE="clear:bg:fg:cd:cd -:cd ..:exit:date:w:* --help:ls:l:ll:lll"

# Test if ~/.aliases exists and source it
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

#Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Respect .gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
# colors for later use
clr_reset="$(tput sgr0)"
clr_red="$(tput setaf 1)"
clr_blue="$(tput setaf 4)"
clr_cyan="$(tput setaf 6)"
clr_white="$(tput setaf 7)"

# command prompt
prompt_command () {
  if [ $? -eq 0 ]; then local clr_status="$clr_white"
  else local clr_status="$clr_red"; fi

  if [ $USER = root ]; then local sign="#"
  else local sign="$"; fi

  local timestamp="$(date +'%H:%M:%S')"
  local top="$timestamp \u@\H"
  local prompt="$clr_blue[\w]$clr_reset $clr_status$sign$clr_reset"

  PS1="$(printf "\n\r%s\n%s " "$top" "$prompt")"
}
PROMPT_COMMAND=prompt_command
