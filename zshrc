# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jonathan"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"


bindkey "^p" up-line-or-beginning-search
bindkey "^n" down-line-or-beginning-search

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract rsync systemadmin systemd jsontools)

######################
# User configuration #
######################
export TZ='Asia/Shanghai'
#export LANG=zh_CN.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export MANPATH="/usr/local/man:$MANPATH"
export PERL5LIB=$HOME/perl5:$HOME/perl5/lib/perl5
export PATH="$HOME/.xmonad/bin:/bin:/usr/sbin:/sbin:$HOME/phab/virgo/build/bin:$PATH"
source $ZSH/oh-my-zsh.sh

export C_INCLUDE_PATH=$HOME/playground/QuantLib-1.18
export CPLUS_INCLUDE_PATH=$HOME/playground/QuantLib-1.18
#export LIBRARY_PATH=$HOME/phab/virgo/build/lib:$HOME/phab/apus/build/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/phab/virgo/build/lib:$HOME/phab/apus/build/lib:$HOME/phab/pumpman/build/lib
export LD_LIBRARY_PATH=$HOME/phab/apus/build/lib:$HOME/phab/virgo/build/lib:$HOME/phab/virgo/build/lib/python:$HOME/playground/QuantLib-1.18/build/ql

export PYTHONPATH=$HOME/phab/virgo/build/lib/python:$HOME/phab/virgo/tools:$HOME/phab/apus/build/lib/python:$HOME/phab/aries/src/python:$HOME/phab/apus/build/lib/python:$HOME/phab/gemini/src/python:$HOME/phab/aquarius/aqua-facility/src/python:$HOME/phab/draco/build/lib/python:$HOME/phab/pisces/flowrun/src/python:$HOME/phab/pisces/stratrun/src/python:$HOME/phab/cetus/src/python:$HOME/phab/crux:$HOME/phab/libra/src/python:$HOME/phab/taurus/src/python


export VIRGO_SRC_ROOT=$HOME/phab/virgo
export VIRGO_LIB_ROOT=$HOME/phab/virgo/build

export DRACO_SRC_ROOT=$HOME/phab/draco
export DRACO_LIB_ROOT=$HOME/phab/draco/build
#export DRACO_KVSERVER="0.0.0.0:9000"
export STRATRUN_WS=$HOME/stratrun


export PATH=$PATH:/opt/sge/bin:/opt/sge/bin/lx-amd64

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#############################
#        Init               #
#############################
if [ ! -z "$TERM" ]; then
    source $HOME/.motd
fi

if [ -f $HOME/.alias ]; then
    . $HOME/.alias
fi

if [ -f $HOME/.inputrc ]; then
    . $HOME/.inputrc
fi

PATH="/home/pragmatt/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/pragmatt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/pragmatt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/pragmatt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/pragmatt/perl5"; export PERL_MM_OPT;
