alias reload="bash-it reload; exec bash"

# sys diag
alias ntop="sudo nethogs -v 0 -d .333"
alias ctop="htop"
alias gtop="watch -n 0.1 nvidia-smi"
alias mon="bashtop"
alias ports="sudo netstat -ntlp"

# process
alias stalk="ps -e | grep "
alias murder="pkill -9 -e -n -x "

# git
alias checkout="git checkout "
alias push="git push origin HEAD "
alias pull="git pull origin HEAD "
alias discard="git restore ."
function revert() {
  git fetch origin $(git rev-parse --abbrev-ref HEAD)
  git reset FETCH_HEAD --hard
}
function squash() {
  git reset --soft HEAD~$1 &&
    git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"
}
function git-patch() {
  git diff --no-prefix "${1}" >"${2}"
}
