setopt promptsubst
autoload -U promptinit
promptinit
prompt grb

autoload -U compinit
compinit

# Add paths that should have been there by default
export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:/usr/local/sbin

# Alias para hacer fix de un git merge
alias fix='git diff --name-only | uniq | xargs subl'

# Alias de cavi
alias apache_logs='cd /private/var/log/apache2/'
alias vhosts='sudo mate /private/etc/apache2/extra/httpd-vhosts.conf'
alias hosts='sudo mate /etc/hosts'
alias apache_restart='sudo apachectl restart'
alias restart_rails='touch tmp/restart.txt'
alias wget='curl -O'

alias ll='ls -l'
alias la='ls -l -a'

alias be='bundle exec'

alias apache_errors='mate /private/var/log/apache2/error_log'

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
alias ctags=/usr/local/bin/ctags
# alias vimdiff=/bin/vimdiff
alias sqlite='sqlite3'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
# npm
# export NODE_PATH="/usr/local/lib/node"
# export PATH="local/share/npm/bin:$PATH"



 #Unbreak history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Unbreak Python's error-prone .pyc file generation
export PYTHONDONTWRITEBYTECODE=1

export WORDCHARS='*?[]~&;!$%^<>'

# ACTUAL CUSTOMIZATION OH NOES!
gd() { git diff $* | view -; }
gdc() { gd --cached $*; }
alias pygrep="grep --include='*.py' $*"
alias rbgrep="grep --include='*.rb' $*"
stty -ixon
# binds
bindkey -v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^b' backward-word
bindkey -M viins '^f' forward-word
bindkey -M vicmd '^r' history-incremental-search-backward

activate_virtualenv() {
    if [ -f env/bin/activate ]; then . env/bin/activate;
    elif [ -f ../env/bin/activate ]; then . ../env/bin/activate;
    elif [ -f ../../env/bin/activate ]; then . ../../env/bin/activate;
    elif [ -f ../../../env/bin/activate ]; then . ../../../env/bin/activate;
    fi
}

python_module_dir () {
    echo "$(python -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

# Originally from Jonathan Penn, with modifications by Gary Bernhardt
function whodoneit() {
    (set -e &&
        for x in $(git grep -I --name-only $1); do
            git blame -f -- $x | grep $1;
        done
    )
}

function rvm_ruby_prompt {
  if (declare -f rvm > /dev/null) {
      if [[ -x $MY_RUBY_HOME ]]
      then ruby -v | sed 's/\([^(]*\).*/\1/'
      fi
  }
}

# Rubies are red, and my rprompt is too
RPROMPT='%{$fg[red]%}$(rvm_ruby_prompt)%{$reset_color%}%'

function translate(){ wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" | sed 's/.*"translatedText":"\([^"]*\)".*}/\1/'; }

# git  diff on vim
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

# mvim()
# {
# (unset GEM_PATH GEM_HOME; command mvim "$@")
# }

# CAVI COSAS DE MI ENTORNO
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
