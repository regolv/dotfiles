
find ~/Code/dotfiles/ -name aliases.zsh | while read INSTALL ; do source "${INSTALL}" ; done

source ~/Code/dotfiles/zsh/colors.zsh
source ~/Code/dotfiles/zsh/setopt.zsh
source ~/Code/dotfiles/zsh/exports.zsh
source ~/Code/dotfiles/zsh/prompt.zsh
source ~/Code/dotfiles/zsh/completion.zsh
# source ~/.zsh/aliases.zsh
# source ~/.zsh/bindkeys.zsh
# source ~/.zsh/functions.zsh
# source ~/.zsh/history.zsh
# source ~/.zsh/zsh_hooks.zsh
