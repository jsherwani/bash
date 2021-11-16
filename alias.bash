
# ---------------------------
# CUSTOM ALIASES
# ---------------------------

# Git: Delete all non-master branches
alias dnm="git branch | grep -v ' master$' | xargs git branch -D"

alias recommit="git commit --amend --no-edit"

# Git: Add all, commit, and push
commit() {
  git add -u
  git commit -m "$1"
  git push
}

dev() {
  if [ $# -eq 0 ]
  then
    git checkout -B dev && git push --force --set-upstream origin dev && git checkout -
    return
  fi
  for ((i = 1; i <= $#; i++)); do
    git checkout -B dev-${!i} && git push --force --set-upstream origin dev-${!i} && git checkout -
  done 
}
