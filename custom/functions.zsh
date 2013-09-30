# Open/clone project
p() {
  if [[ -d ~/github/$1 ]]; then
    cd ~/github/$1
  else
    if [[ -f $BOXEN_HOME/repo/modules/projects/manifests/$1.pp ]]; then
      boxen $1 ; cd ~/github/$1
    else
      cd ~/github
      git clone git@github.com:github/$1.git && cd ~/github/$1
    fi
  fi
}

# Find files matching name
f() {
  if [[ $# -eq 1 ]]; then
    find . -name "*$1*" -not -ipath '*.git*' -not -ipath '*/vendor/*'
  elif; then
    find $2 -name "*$1*"
  fi
}
