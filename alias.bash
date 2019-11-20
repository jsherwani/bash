
# ---------------------------
# CUSTOM ALIASES
# ---------------------------

# Git: Delete all non-master branches
alias dnm="git branch | grep -v ' master$' | xargs git branch -D"

# Git: Delete all non-master branches
alias recommit="git commit --amend --no-edit"

# Git: Add all, commit, and push
commit() {
  git add -u
  git commit -m "$1"
  git push
}
