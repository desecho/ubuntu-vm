function dockerti(){
    docker exec -ti $1 sh
}

function getsecret(){
    kubectl get secret "$1" -o json | jq -r ".data.$2" | base64 -d
}

function kubectlti(){
    kubectl exec -ti $1 -- sh
}

function clean_docker() {
    docker system prune -a
    docker volume rm "$(docker volume ls --filter dangling=true -q)"
}

alias gitamend='git add . && git commit --amend --no-edit'
alias fastcommit='git add . && git commit -m"Changes"'
alias fastpush='fastcommit && git push'
