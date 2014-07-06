
find ~/Code/dotfiles/ -name aliases.zsh | while read INSTALL ; do source "${INSTALL}" ; done

source ~/Code/dotfiles/zsh/colors.zsh
source ~/Code/dotfiles/zsh/setopt.zsh
source ~/Code/dotfiles/zsh/exports.zsh
source ~/Code/dotfiles/zsh/prompt.zsh
source ~/Code/dotfiles/zsh/completion.zsh
source ~/Code/dotfiles/zsh/bindkeys.zsh
source ~/Code/dotfiles/zsh/functions.zsh
source ~/Code/dotfiles/zsh/history.zsh
source ~/Code/dotfiles/zsh/hooks.zsh
