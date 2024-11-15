if [[ `hostname` == st-* ]]; then
  base_project_dir="$HOME/stripe"
else
  base_project_dir="$HOME/p"
fi

# Open/clone project
p() {
  if [[ $# -eq 0 ]]; then
    cd $base_project_dir
    return
  elif [[ $# -gt 1 ]]; then
    echo "Usage: p [<repo>|<user/repo>]"
    return 1
  fi

  cd $(project_dir "$@")
}

project_dir() {
  # base_project_dir=$(base_proj_dir)
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
    user="adelcambre"
  fi

  if [[ -d $base_project_dir/$repo ]]; then
    echo $base_project_dir/$repo
  else
    cd $base_project_dir
    git clone git@github.com:$user/$repo.git && echo $base_project_dir/$repo
  fi
}

# # Goto symlink in gopath for go projects
# g() {
#   if [[ $# -eq 0 ]]; then
#     project_dir=$(greadlink -f $(pwd))
#   else
#     project_dir=$(greadlink -f $(project_dir "$@"))
#   fi

#   go_proj_dir=$(gfind "$(greadlink -f $GOPATH)" -lname $project_dir)

#   if [[ "$go_proj_dir" = "" ]]; then
#     echo "Not a go project (or no symlink) $1"
#     return 1
#   else
#     cd $go_proj_dir
#   fi
# }

# Find files matching name
f() {
  if [[ $# -eq 1 ]]; then
    find . -iname "*$1*" -not -ipath '*.git*' -not -ipath '*/vendor/gems/*'
  elif; then
    find $2 -iname "*$1*"
  fi
}

samldecode () {
    echo $1 | base64 --decode | xmllint --format -
}
