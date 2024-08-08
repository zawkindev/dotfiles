#!/usr/bin/env bash
#===============================================================================
#   * Original code by Wenxuan (wenxuangm@gmail.com)
#   * Modified by Shahruz (zawkindev@gmail.com)
#===============================================================================

# Options
rarrow=''
larrow=''
date_format='%F'

# short for Theme-Colour
TC='violet'
case $TC in
    'gold' )
        TC='#ffb86c'
        ;;
    'redwine' )
        TC='#b34a47'
        ;;
    'moon' )
        TC='#00abab'
        ;;
    'forest' )
        TC='#228b22'
        ;;
    'violet' )
        TC='#9370db'
        ;;
    'snow' )
        TC='#fffafa'
        ;;
    'coral' )
        TC='#ff7f50'
        ;;
    'sky' )
        TC='#87ceeb'
        ;;
    'everforest' )
        TC='#a7c080'
        ;;
    'default' ) # Useful when your term changes colour dynamically (e.g. pywal)
        TC='colour3'
        ;;
esac

FG=#626262
BG=#262626 #235
G01=#3a3a3a #237

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$BG"
tmux_set status-attr none

# Left side of status bar
tmux_set status-left "#[fg=$BG,bg=$TC,bold] #h #[fg=$TC,bg=$BG,nobold]$rarrow"

# Right side of status bar
tmux_set status-right "#[fg=$TC,bg=$BG]$larrow#[fg=$BG,bg=$TC,bold] $date_format "

# Window status format
tmux_set window-status-format         "#[fg=$BG,bg=$G01]$rarrow#[fg=$TC,bg=$G01] #I:#W#F #[fg=$G01,bg=$BG]$rarrow"
tmux_set window-status-current-format "#[fg=$BG,bg=$TC]$rarrow#[fg=$BG,bg=$TC,bold] #I:#W#F #[fg=$TC,bg=$BG,nobold]$rarrow"

# Pane border
tmux_set pane-border-style "fg=$BG,bg=default"

# Active pane border
tmux_set pane-active-border-style "fg=$TC,bg=default"

# Pane number indicator
tmux_set display-panes-colour "$BG"
tmux_set display-panes-active-colour "$TC"

# Message
tmux_set message-style "fg=$TC,bg=$BG"

# Command message
tmux_set message-command-style "fg=$TC,bg=$BG"

# Copy mode highlight
tmux_set mode-style "bg=$TC,fg=$FG"

