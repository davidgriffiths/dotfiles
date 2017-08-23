PROMPT='%{$fg_bold[blue]%}%n%{$reset_color%} in %{$fg_bold[green]%}%c %{$reset_color%}on $(git_prompt_info)
%{$fg[blue]%}★ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"
