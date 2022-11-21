#!/usr/bin/env bash

# Kubectl
function getsecret() {
  kubectl get secrets "$1" -o json | jq '.data | map_values(@base64d)'
}

function kti() {
  kubectl exec -ti "$1" -- sh
}

#------------------------------------------------------------------------------

# Docker
function dockerti() {
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

function grmaster() {
  current_branch=$(git branch --show-current)
  default_branch=$(_get_default_branch)
  git switch "${default_branch}"
  git pull
  git switch "${current_branch}"
  git rebase "${default_branch}"
}

function gmaster() {
  git switch "$(_get_default_branch)"
  git pull
}
alias gmain="gmaster"

alias gamend="git add . && git commit --amend --no-edit"
alias gcamend="git add . && git commit --amend"
alias glog="git log"
alias gl="git log --oneline --decorate"
alias gcm="git commit -m"
alias gc="git commit"
alias gcam="git add . && git commit -m"
alias gpush!="git push --force-with-lease"
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
# Does gamend && gpush!
alias ff!="git add . && git commit --amend --no-edit && git push --force-with-lease"

#------------------------------------------------------------------------------
# Other

function forcekill() {
  pkill -f "$1"
}

alias kctx="rm -f ~/.kube/config.lock && kubectx"
alias measure="/usr/bin/time -p"

#------------------------------------------------------------------------------
# Replacements
alias ls=exa
#------------------------------------------------------------------------------
