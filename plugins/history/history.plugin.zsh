###
# history - Set Zsh history options.
###

#
# Requirements
#

zstyle -t ':zephyr:core' initialized || return 1

#
# Options
#

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt NO_HIST_BEEP              # Do not beep when accessing non-existent history.

#
# Variables
#

HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history
[[ -f $HISTFILE ]] || { mkdir -p ${HISTFILE:h} && touch $HISTFILE }
HISTSIZE=5000   # max history in session
SAVEHIST=10000  # max entries in HISTFILE

#
# Aliases
#

# Lists the ten most used commands.
alias history-stat="command history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"
alias hist='fc -l -i'
