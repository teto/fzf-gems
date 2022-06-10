# GIT heart FZF
# -------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1 || echo "This_is_not_a_git_repository"
}

fzf-down() {
  fzf --height 50% --multi --layout=reverse-list --bind ctrl-p:toggle-preview --bind ctrl-s:toggle-sort "$@" --border
}

FZF_PREFIX="fzf-git"
#GIT_LOG_PRETTY="git log --color=always --oneline --graph --date=short --pretty=\"format:%C(auto)%cd %h%d %s\""
GIT_LOG_PRETTY="git log --color=always --oneline --graph --decorate --pretty=format:'%C(bold yellow)%h%Creset - %C(bold yellow)%d%Creset %Cgreen%cr%Creset | %Cgreen%cd%Creset | %C(bold yellow)%an%Creset | %s' --abbrev-commit --date-order --date=format:'%Y-%m-%d %H:%M:%S %a'"

function "${FZF_PREFIX}gf" () {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down --ansi --nth 2..,.. \
    --preview-window=right,$[$COLUMNS/2] \
    --preview 'git diff HEAD --color=never -- {-1} | bat --style=changes --decorations=always --color=always --terminal-width $[$COLUMNS/2] --wrap=auto --theme=zenburn | sed 1,4d' |
  cut -c4- | sed 's/.* -> //'
}

function "${FZF_PREFIX}gb" () {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --tac \
    --preview-window right:70%:wrap \
    --preview $GIT_LOG_PRETTY' $(sed s/^..// <<< {} | cut -d" " -f1) -- | head -1000' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# git tag
function "${FZF_PREFIX}gt" () {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --preview-window right:50%:wrap \
    --preview 'git show --color=always {} | head -$LINES'
}

function "${FZF_PREFIX}gh" () {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort \
     --preview-window right:50%:wrap \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -1 | xargs git show --color=always | head -$LINES' |
  grep -o "[a-f0-9]\{7,\}" | head -1
}

function "${FZF_PREFIX}gr" () {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview-window right:50%:wrap \
    --preview $GIT_LOG_PRETTY' --remotes={1} | head -200' |
  cut -d$'\t' -f1
}
