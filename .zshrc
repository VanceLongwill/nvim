# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/vancelongwill/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="avit"
# ZSH_THEME="robbyrussel"
ZSH_THEME="af-magic"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Path 
# USEFUL TO SYMLINK /usr/local/bin/ for cli apps
# path+=('~/Applications/vimr')
# Necessary for awscli
path+=('/Users/vlongwill/Library/Python/3.6/bin')
path+=('/Users/vlongwill/Library/nvim/vimr')
path+=('~/.nexustools')
path+=('$HOME/.cargo/bin')

path+=('/usr/local/opt/python@2/libexec/bin')
path+=('/usr/local/lib/python2.7/site-packages')
path+=('/usr/local/lib/python3.6/site-packages')
path+=('/usr/local/lib/python3.7/site-packages')
path+=('/Users/vlongwill/.bin')
path+=('/Users/vancelongwill/Library/Python/3.6')
path+=('/Users/vancelongwill/Library/Python/3.7/bin')
path+=('/Users/vancelongwill/Library/Python/2.7')
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


# export PYTHONPATH="${PYTHONPATH}:/usr/local/lib/python2.7/site-packages:/usr/local/lib/python3.6/site-packages:/usr/local/opt/python@2/libexec/bin"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vimr="/Users/vlongwill/Library/nvim/vimr"
alias vims="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
# alias vim="launchVim"

launchVim () {
  # TODO: make more robust IS_VIM_SUSPENDED, get process number
  IS_VIM_SUSPENDED=$(jobs | grep suspended | grep -c nvim)
  VIM_COMMAND="nvr --remote-tab "
  VIM_COMMAND+="$@"

  if [ $IS_VIM_SUSPENDED -eq 1 ] # if suspended neovim job found
  then
    # start background process in subshell so output doesnt leak onto nvim screen
    eval "($VIM_COMMAND &)" 
    fg # TODO: call process by number e.g. fg %2
   else 
    eval "$VIM_COMMAND"
  fi
}

# alias nvim="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim"
export EDITOR="vim"
alias vimgo="nvim -u ~/.config/nvim/init.go.vim"

fpath=(/usr/local/share/zsh-completions $fpath)
eval $(thefuck --alias)

# NVIM (nvr)
# export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# OPAM configuration
. /Users/vlongwill/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh


#ADB
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U zmv
alias mmv='noglob zmv -W'

# Perl locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# golang 
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
