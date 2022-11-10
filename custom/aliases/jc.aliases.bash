# --------------------------------------------
# BASH MANAGEMENT
# --------------------------------------------

# reload shell
alias reload="bash-it reload; exec bash"
# installation
function sysup() {
  sudo apt install -y nethogs htop bashtop
}

# --------------------------------------------
# DIAGNOSTICS
# --------------------------------------------

# general system usage overview
alias mon="bashtop"
# cpu/mem/proc usage
alias ctop="htop"
# gpu usage
alias gtop="watch -n 0.1 nvidia-smi"
# network usage
alias ntop="sudo nethogs -v 0 -d .333"
# list open ports/processes
alias ports="sudo netstat -ntlp"

# --------------------------------------------
# PROCESS MANAGEMENT
# --------------------------------------------

# find proc by partial name match
alias stalk="ps -e | grep "
# force kill a proc by exact name match
alias murder="sudo pkill -9 -e -n -x "

# --------------------------------------------
# GIT SHORTCUTS
# --------------------------------------------

alias log="git log"
alias status="git status"
alias add="git add"
alias checkout="git checkout"
alias commit="git commit"
# pull current branch
alias pull="git pull origin HEAD"
# push current branch
alias push="git push origin HEAD"
# push current branch without verification
alias shove="git push origin HEAD --no-verify"
# commit without verification
alias commend="git commit --no-verify"
# discard local changes
alias discard="git restore ."
# list file touched by this branch 
alias touched="git log --name-status"
# revert branch local state to remote state
function revert() {
  git fetch origin $(git rev-parse --abbrev-ref HEAD)
  git reset FETCH_HEAD --hard
}
# squash top $1 commits
function squash() {
  git reset --soft HEAD~$1 &&
  git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"
}
# generate patch file from diff on $1 output to $2
function git-patch() {
  git diff --no-prefix "${1}" > "${2}"
}

