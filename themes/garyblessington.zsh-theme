if [[ `uname` == Darwin ]]; then
  HOST_COLOR="%{$fg_bold[green]%}"
else
  HOST_COLOR="%{$fg_bold[yellow]%}"
fi

PROMPT='$HOST_COLOR${HEROKU_CLOUD:-production}%{$reset_color%} %{$fg[cyan]%}%c%{$fg_bold[blue]%} $(rbenv version-name)$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}: '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
