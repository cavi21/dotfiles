fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
# Set up rvm
[[ -s "/Users/cavi/.rvm/scripts/rvm" ]] && source "/Users/cavi/.rvm/scripts/rvm"
# rvm use 1.9.2-p290@global
set -o vi

[[ -s $HOME/.functions ]] && source $HOME/.functions

# editor variable
# Add paths that should have been there by default
export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:/usr/local/sbin

export EDITOR='vi'
export VISUAL='vi'
export VIMRC=$HOME/.vimrc


# npm
#
# to my .bashrc file. As some modules have executables you will also need to add /usr/local/share/npm/bin to your PATH. Here's how mine looks
#
export PATH="/usr/local/share/npm/bin:$PATH"
#
#
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

if [ -f ~/.bash_aliases_mac ] ; then
  source ~/.bash_aliases_mac
fi

cdpath=( ~/Sites)

echo $PATH | grep -q -s "usr/local/bin:/usr/local/mysql/bin"
if [ $? -eq 1 ] ; then
  PATH=$PATH:/usr/local/bin:/usr/local/mysql/bin
  export PATH
fi
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
