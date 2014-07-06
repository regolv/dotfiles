
find ~/Code/dotfiles/ -name aliases.zsh | while read INSTALL ; do source "${INSTALL}" ; done

source ~/Code/dotfiles/zsh/colors.zsh
source ~/Code/dotfiles/zsh/setopt.zsh
# source ~/.zsh/exports.zsh
source ~/Code/dotfiles/zsh/prompt.zsh
# source ~/.zsh/completion.zsh
# source ~/.zsh/aliases.zsh
# source ~/.zsh/bindkeys.zsh
# source ~/.zsh/functions.zsh
# source ~/.zsh/history.zsh
# source ~/.zsh/zsh_hooks.zsh
