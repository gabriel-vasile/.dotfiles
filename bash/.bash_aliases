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
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gp='git pull'
alias gm='git merge'
alias gco='git commit'
alias gps='git push'
alias gra='git remote add'
alias grr='git remote rm'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gpushom='git push origin master'
alias gpullom='git pull origin master'
alias grh='git reset --hard'
function glf() { git log --all --grep="$1"; }

function gardiff_function() {
	if [ "$#" -ne 1 ]; then
		git archive -o update.zip HEAD $(git diff --name-only)
	else
    	git archive -o update.zip HEAD $(git diff --name-only HEAD~$1)
    fi
}

alias gardiff=gardiff_function

# if there are any files comitted in the repo that need to be removed from git
# but kept on disk
# alias apply-gitignore=!git ls-files -ci --exclude-standard -z | xargs -0r git rm --cached

alias fuck='sudo $(history -p \!\!)'

alias dc='docker-compose'
alias d='docker'
alias dm='docker-machine'
