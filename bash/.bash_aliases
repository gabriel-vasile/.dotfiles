# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# cd
alias ..='cd ..'
alias ...='cd ../..'

# git
alias g='git'
alias gi='git init'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gp='git pull'
alias gm='git merge'
alias gco='git commit -S'
alias gta='git tag -s'
alias gps='git push'
alias gra='git remote add'
alias grr='git remote rm'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gpullom='git pull origin master'
alias gfa='git fetch --all'
# alias gpushom='git push origin master'
alias grh='git reset --hard'
function glf() { git log --all --grep="$1"; }

function fail() {
    echo -e "\033[00;31m! $1\033[0m"
}
function gpushom_function() {
    if git remote show origin | grep -q "local out of date"; then
        fail "different head on remote"
    else
        git push origin master
    fi
}
function gardiff_function() {
	if [ "$#" -ne 1 ]; then
		git archive -o update.zip HEAD $(git diff --name-only)
	else
    	git archive -o update.zip HEAD $(git diff --name-only HEAD~$1)
    fi
}
function grin_function() {
    if [ "$#" -eq 1 ]; then
        grep -Irn $1 .
    fi
}

alias gardiff=gardiff_function
alias grin=grin_function
alias gpushom=gpushom_function

# if there are any files comitted in the repo that need to be removed from git
# but kept on disk
# alias apply-gitignore=!git ls-files -ci --exclude-standard -z | xargs -0r git rm --cached

alias fuck='sudo $(history -p \!\!)'
alias nemo='nautilus --no-desktop'

alias dc='docker-compose'
alias d='docker'
alias dm='docker-machine'

alias hgrep='history | grep '

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

# kube
alias kc=kubectl
