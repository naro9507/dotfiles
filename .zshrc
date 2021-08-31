# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh

# .zshrc
source ${HOME}/.zshenv

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/develop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/develop/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/develop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/develop/google-cloud-sdk/completion.zsh.inc'; fi

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# zplug
source ./setup/zplug.zsh
$HOME/theme.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
