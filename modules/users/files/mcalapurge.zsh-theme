local name="%n@%m"
local current_dir="%B%F{blue}%~%f%b"
local git_branch='$(git_prompt_info)'



PROMPT="╭─ ${name} : ${current_dir} ${git_branch} 
╰─λ$PR_PROMPT "
RPROMPT="[%*]"


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
