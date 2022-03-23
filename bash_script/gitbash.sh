#! /bin/sh

# see https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt

# you add ~/.bashrc

#-----------------------------------------------------
# # Git Configuration
# if [ -e /home/pi/.bash_git ]; then
#   source /home/pi/.bash_git
# fi
#-----------------------------------------------------


# Terminal colours (after installing GNU coreutils)
NM="\[\033[0;38m\]"  # means no background and white lines
GR="\[\033[0;90m\]"  # dark grey
HI="\[\033[0;37m\]"  # change this for letter colors
HII="\[\033[0;31m\]" # change this for letter colors
SI="\[\033[0;33m\]"  # this is for the current directory
IN="\[\033[0m\]"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /'
}

#export PS1="$NM[ $HI\u $HII\h $SI\w$NM ] $IN"
export PS1="$HII\h $SI\w$GR\$(parse_git_branch)$NM] $IN"

function gi() { curl https://www.gitignore.io/api/$@ ;}
alias gilist="gi list"
alias gidefualt="gi vim,osx,linux,windows"
alias gijava="gi vim,osx,linux,windows,java,maven,gradle,eclipse,intellij"
alias giphp="gi vim,osx,linux,windows,laravel,composer,phpstorm"
alias gits='git status ./'
alias gitsu='git status ./ -uno'
alias gitd='git diff ./ -uno'
alias gitc='gitcommit'

function gitcommit()
{
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage : gitc [userid] \"comment\" [directory|file] ...";
    return;
  fi;
  CMD="git commit --author \"$1 <$1>\" -m \"$2\""
  for ((i=3; i <= $#; i++))
  do
    CMD="$CMD ${!i}"
  done

  eval $CMD
}
