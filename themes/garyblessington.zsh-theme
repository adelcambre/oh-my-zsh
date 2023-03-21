if [[ `hostname` == st-* ]]; then
  HOST_COLOR="%{$fg_bold[green]%}"
  SHORT_HOST=stripe
else
  HOST_COLOR="%{$fg[yellow]%}"
fi

PROMPT='$HOST_COLOR$SHORT_HOST%{$reset_color%} %{$fg[cyan]%}%c%{$fg_bold[blue]%} $(rbenv version-name)$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}%# '

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
