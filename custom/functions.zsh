# Open/clone project
p() {
  if [[ $# -eq 0 ]]; then
    cd ~/heroku
    return
  elif [[ $# -gt 1 ]]; then
    echo "Usage: p [<repo>|<user/repo>]"
    return 1
  fi

  cd $(project_dir "$@")
}

project_dir() {
  # Custom aliases
  case $1 in
    dotfiles)
      echo ~/dotfiles
      return
      ;;
  esac
  user=`dirname $1`
  repo=`basename $1`

  if [[ "$user" = "." ]]; then
    user="heroku"
  fi

  if [[ -d ~/heroku/$repo ]]; then
    echo ~/heroku/$repo
  else
    cd ~/heroku
    git clone git@github.com:$user/$repo.git && echo ~/heroku/$repo
  fi
}

# Goto symlink in gopath for go projects
g() {
  if [[ $# -eq 0 ]]; then
    project_dir=$(greadlink -f $(pwd))
  else
    project_dir=$(greadlink -f $(project_dir "$@"))
  fi

  go_proj_dir=$(gfind "$(greadlink -f $GOPATH)" -lname $project_dir)

  if [[ "$go_proj_dir" = "" ]]; then
    echo "Not a go project (or no symlink) $1"
    return 1
  else
    cd $go_proj_dir
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

samldecode () {
    echo $1 | base64 --decode | xmllint --format -
}

api-console() {
  if [[ $# -eq 1 ]]; then
    cloud=$1
  else
    cloud="production"
  fi

  if [[ $cloud = "prod" ]]; then
    cloud="production"
  fi

  echo "Cloud: $cloud"
  lima run:inside ${cloud}:api slack.1 bin/console
}
