# Open/clone project
p() {
  # Custom aliases
  case $1 in
    dotfiles)
      cd ~/dotfiles
      return
      ;;
  esac
  user=`dirname $1`
  repo=`basename $1`

  if [[ "$user" = "." ]]; then
    user="heroku"
  fi

  if [[ -d ~/p/$repo ]]; then
    cd ~/p/$repo
  else
    cd ~/p
    git clone git@github.com:$user/$repo.git && cd ~/p/$repo
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
