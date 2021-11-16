# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "
ENDLINE=$'\n'
PROMPT='${ENDLINE}[%*] %{$fg[green]%}%/%{$reset_color%}$(git_prompt_info)${ENDLINE}%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=":%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
