# cd
alias ..='cd ..'
alias ...='cd ../..'

alias d='docker'
alias dc='docker-compose'
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
alias gpushom='git push origin master'


alias hack='history | ack '
alias fuck='sudo $(history -p \!\!)'

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
