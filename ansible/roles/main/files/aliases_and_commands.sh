# shellcheck disable=SC2148

function dockersh(){
    docker exec -ti "$1" sh
}

function getsecret(){
    kubectl get secret "$1" -o json | jq -r ".data.$2" | base64 -d
}

function kubectlsh(){
    kubectl exec -ti "$1" -- sh
}

function dockerclean() {
    docker system prune -a
    docker volume rm "$(docker volume ls --filter dangling=true -q)"
}

function gitrebase() {
    branch=$(git branch --show-current)
    git checkout master
    git pull
    git checkout "$branch"
    git rebase master
}

function gitupdate() {
    git checkout master
    git pull
}

alias gitamend='git add . && git commit --amend --no-edit'
alias fastcommit='git add . && git commit -m"Changes"'
alias fastpush='fastcommit && git push'
