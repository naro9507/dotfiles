# Not Used

#!/bin/zsh

autoload -U colors; colors
autoload -U add-zsh-hook

# kubernetes
function _kube-current-context () {
  KUBE_CONTEXT=$(kubectl config current-context)
}

function _kube-current-namespace () {
  KUBE_NAMESPACE=$(kubectl config view --minify | grep namespace: | cut -d":" -f2)
}

add-zsh-hook precmd _kube-current-context
add-zsh-hook precmd _kube-current-namespace

case "$KUBE_CONTEXT" in
  *production*) PCOLOR="red" ;;
  *staging*) PCOLOR="green" ;;
  *)       PCOLOR="yellow" ;;
esac

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

echo $KUBE_NAMESPACE
# prompt
PROMPT='%{$fg[$PCOLOR]%}[${KUBE_CONTEXT}/${KUBE_NAMESPACE# }]%{$reset_color%}@%n %c
%F{green}->%f $ '
RPROMPT='%F{cyan}$vcs_info_msg_0_%f'