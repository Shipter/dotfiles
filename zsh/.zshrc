# Blinking block cusor
echo -e -n "\x1b[\x30 q"

#### Prompt ####
color1=$'126'
color2=$'129'
color3=$'green'
r_color1=$'236'
linux_icon=$'\uf17c'
git_icon=$'\uf09b'
git_branch_icon=$'\ue725'
python_icon=$'\uf81f'
triangle_left=$'\uE0B0'
triangle_right=$'\uE0B2'
arrow_left=$'\ufb0c'
newline=$'\n'

# Git support in PROMPT
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{$color2}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{$color2}●%f'
zstyle ':vcs_info:*' formats "%F{$black} $git_icon $git_branch_icon %b %u %c%f"
zstyle ':vcs_info:*' actionformats ' %u%c'
precmd() { vcs_info }

# Getting conda env name for PROMPT: if activated
add_conda_name() {
    if [ ! -z "$CONDA_DEFAULT_ENV" ]
    then
        local conda_env_name="%F{$r_color1} ${python_icon} $CONDA_DEFAULT_ENV%F"
        echo $conda_env_name
fi
}

PROMPT='%K{$color1}${linux_icon} %k%F{$color1}%K{$color2}${triangle_left}%k%f%K{$color2}%~ %k%F{$color2}%K{$color3}${triangle_left}%k%f%K{$color3}${vcs_info_msg_0_}$(add_conda_name)%k%F{$color3}${triangle_left}%f ${newline}${arrow_left} ' 
# RPROMPT='%K{$r_color1}${triangle_right}  sha%k'

#### Source Files ####
source $ZDOTDIR/.aliases
source $ZDOTDIR/.func

#### Basic Stuff ####

# Navigate without typing 'cd'
setopt  autocd autopushd pushdignoredups

# Vim mode
bindkey -v
export KEYTIMEOUT=1

# Case Insensitive Tab Completion
autoload -Uz compinit
_comp_options+=(globdots) # enable hidden files
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select 
compinit

: '
# <<<<<<<<<<<<<<<<< Lazyload nvm	
nvm() {
    unset -f nvm
    export NVM_DIR=~/.config/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}
 
node() {
    unset -f node
    export NVM_DIR=~/.config/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

 
npm() {
    unset -f npm
    export NVM_DIR=~/.config/nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}
# Lazsyload nvm >>>>>>>>>>>>>>>>>>>>
'

# Load nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
source $HOME/miniconda3/bin/activate
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<


# alias luamake=/home/ship/repos/lua-language-server/3rd/luamake/luamake

# This shoud be the last line of the file
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

