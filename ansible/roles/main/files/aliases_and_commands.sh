# shellcheck disable=SC2148

# Custom names are for `getsecret`, `fastpush`, `fastcommit`, `fastamend`.
# These are the names which don't start with the command they are calling.

# Kubectl
function getsecret(){
    kubectl get secret "$1" -o json | jq -r ".data.$2" | base64 -d
}

function kti(){
    kubectl exec -ti "$1" -- sh
}

#------------------------------------------------------------------------------

# Docker
function dockerti(){
    docker exec -ti "$1" sh
}

function dockerclean() {
    docker system prune -a
    docker volume rm "$(docker volume ls --filter dangling=true -q)"
}

#------------------------------------------------------------------------------
# Git

function _get_default_branch() {
    git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@'
}

function grm() {
    current_branch=$(git branch --show-current)
    default_branch=$(_get_default_branch)
    git switch "$default_branch"
    git pull
    git switch "$current_branch"
    git rebase "$default_branch"
}

function gmaster() {
    git switch "$(_get_default_branch)"
    git pull
}

alias gl='git log --oneline --decorate'
alias gs="git status"
alias gcm="git commit -m"
alias gfpush="git push --force-with-lease"
alias gpush="git push"
alias gstash="git stash"
alias gnew="git switch -c"
alias gpull="git pull"
alias grestore="git restore"
alias greset="git reset"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gri="git rebase -i"
alias fastcommit="git add . && git commit -m'Changes'"
alias fastpush="fastcommit && git push"
alias fastamend="git add . && git commit --amend --no-edit"

#------------------------------------------------------------------------------
# Replacements
alias ls=exa
alias cat=batcat
alias ocat=/usr/bin/cat
#------------------------------------------------------------------------------
