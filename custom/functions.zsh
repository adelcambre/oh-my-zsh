# Open/clone project
p() {
  # Custom aliases
  case $1 in
    dotfiles)
      cd ~/dotfiles
      return
      ;;
  esac
  if [[ -d ~/p/$1 ]]; then
    cd ~/p/$1
  else
    cd ~/p
    git clone git@github.com:github/$1.git && cd ~/p/$1
  fi
}

# Find files matching name
f() {
  if [[ $# -eq 1 ]]; then
    find . -name "*$1*" -not -ipath '*.git*' -not -ipath '*/vendor/gems/*'
  elif; then
    find $2 -name "*$1*"
  fi
}
