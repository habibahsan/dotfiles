# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kolo" # ah-gnzh, kolo, minimal, zhann, wezm+

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
#plugins=(gem git git-flow github laravel5 pip rails rake rbenv)
plugins=(celery composer django docker docker-compose git git-flow gradle heroku mvn laravel5 yarn zsh-autosuggestions zsh-syntax-highlighting)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom aliases
alias c='clear'
alias y='yarn'
alias df='df -h'
alias du='du -h'
alias iotop='sudo iotop'
alias serve='live-server'
alias clip='xclip -sel clip'
alias glr='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;'
alias grr='find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git reset --hard HEAD" \;'
alias serve-by-php='php -S localhost:8080'
alias serve-by-python='python -m SimpleHTTPServer 8080'
alias services='systemctl --type service --state running'
#alias laravel='~/.composer/vendor/bin/laravel'
#alias eclimd='/opt/eclipse/eclimd -b'

# Custom function
wpscan() {
    ruby /home/ahsan/Workspace/Apps/wpscan/wpscan.rb $1
}

speak() {
    echo $1 | festival --tts | espeak --ipa -q $1
}

conip() {
    docker inspect --format='{{.NetworkSettings.IPAddress}}' $1
}

conbridge() {
    docker inspect --format='{{.NetworkSettings.Bridge}}' $1
}

conports() {
    docker inspect --format='{{.NetworkSettings.Ports}}' $1
}

conbinds() {
    docker inspect --format='{{.HostConfig.Binds}}' $1
}

conpid() {
    docker inspect --format='{{.State.Pid}}' $1
}

vd () {
    ffmpeg -i $1 2>&1 | grep "Duration" | awk '{print $2}' | sed s/,//
}

vdt () {
    find "$1" -type f | while read fileLocation ; do
        file=$(basename "$fileLocation")
        duration=$(ffmpeg -i "$fileLocation" 2>&1 | grep "Duration" | awk '{print $2}' | sed s/,//)
        echo "$file: $duration"
    done
}

v() {
    gvim -c "call Maximize_Window()" $1
}

codecept() {
    vendor/bin/codecept $1
}

duh(){
    du -sh *
}

t() {
    tree -L $1
}

cpdf() {
    /home/ahsan/RnD/apps/cpdf $1
}

nb() {
    docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work jupyter/scipy-notebook start-notebook.sh --NotebookApp.password='sha1:5863f261290d:18fd3a0a1393673544e889e520b3a3ddf9f8dd4a'
}

bn() {
    docker run --rm -p 8000:8888 -v "$PWD":/home/jovyan/work jupyter/base-notebook start-notebook.sh --NotebookApp.password='sha1:5863f261290d:18fd3a0a1393673544e889e520b3a3ddf9f8dd4a'
}

exists() { type "$1" > /dev/null 2>&1; }


kp() {
    # mnemonic: [K]ill [P]rocess
    # use [tab] to select one or multiple entries
    # press [enter] to kill selected processes and go back to the process list.
    # or press [escape] to go back to the process list. Press [escape] twice to exit.

    if exists fzf; then
        local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
        if [ "x$pid" != "x" ]
        then
          echo $pid | xargs kill -${1:-9}
          kp
        fi
    fi
    if ! exists fzf; then
        echo "Aborting..."
        echo "fzf is missing. Check out https://github.com/junegunn/fzf#installation"
    fi
}


dr () {
        docker-compose run --rm drush $1
} 

HISTSIZE=20000


# tmux as a default shell
[[ $TERM != "screen" ]] && exec tmux -2
[[ $TMUX != "" ]] && export TERM="screen-256color"

# nvm
# export NVM_DIR="/home/ahsan/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

# rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

#export PATH="$HOME/.yarn/bin:$PATH"
#export PATH="$HOME/.dotfiles/clustergit:$PATH"

# base16 shell
#BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-monokai.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# go environment
#export GOROOT=/opt/go
#export GOPATH=$HOME/Workspace/go
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# flutter environment
#export PATH="$PATH:/home/ahsan/RnD/apps/flutter/bin"
#export ANDROID_HOME=$HOME/RnD/apps/android/sdk
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/platform-tools

# pipenv
export PATH="$PATH:$HOME/.local/bin"

export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
