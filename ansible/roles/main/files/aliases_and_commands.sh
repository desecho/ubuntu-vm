alias gitamend='git add . && git commit --amend --no-edit'
function dockerti(){
    docker -ti $1 bash
}
alias fastcommit='git add . && git commit -m"Changes"'
