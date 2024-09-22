#!/bin/bash

# Set Xfce XSettings
xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"
xfconf-query -c xsettings -p /Net/IconThemeName -s "elementary-xfce"
xfconf-query -c xsettings -p /Net/CursorBlink -s true
xfconf-query -c xsettings -p /Gtk/ButtonImages -s false
xfconf-query -c xsettings -p /Gtk/MenuImages -s true
xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "elementary"

# Set keyboard shortcuts
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>space" -s "xfce4-appfinder"
xfconf-query -c xfce4-keyboard-shortcuts -p "/commands/custom/<Super>space/startup-notify" -s true
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>l" -s "next_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>h" -s "prev_workspace_key"
xfconf-query -c xfce4-keyboard-shortcuts -p "/xfwm4/custom/<Super>f" -s "fullscreen_key"

# Set XFCE panel settings
xfconf-query -c xfce4-panel -p "/plugins/plugin-14" -s "actions"
xfconf-query -c xfce4-panel -p "/plugins/plugin-14/button-title" -s 3
xfconf-query -c xfce4-panel -p "/plugins/plugin-14/custom-title" -s "マフトゥナ"

# Set XFCE terminal settings
xfconf-query -c xfce4-terminal -p "/background-mode" -s "TERMINAL_BACKGROUND_TRANSPARENT"
xfconf-query -c xfce4-terminal -p "/background-darkness" -s 0.75
xfconf-query -c xfce4-terminal -p "/color-foreground" -s "#f6f6f5f5f4f4"
xfconf-query -c xfce4-terminal -p "/color-background" -s "#0000000000004"
xfconf-query -c xfce4-terminal -p "/color-palette" -s "rgb(0,0,0);rgb(224,27,36);rgb(143,240,164);rgb(170,85,0);rgb(53,132,228);rgb(170,0,170);rgb(0,170,170);rgb(170,170,170);rgb(85,85,85);rgb(255,85,85);rgb(85,255,85);rgb(255,255,85);rgb(98,160,234);rgb(255,85,255);rgb(85,255,255);rgb(255,255,255)"
xfconf-query -c xfce4-terminal -p "/color-use-theme" -s false
xfconf-query -c xfce4-terminal -p "/font-name" -s "Hack"
xfconf-query -c xfce4-terminal -p "/font-use-system" -s false
xfconf-query -c xfce4-terminal -p "/misc-menubar-default" -s false

# Set XFWM (Window Manager) settings
xfconf-query -c xfwm4 -p "/general/theme" -s "Greybird"
xfconf-query -c xfwm4 -p "/general/show_dock_shadow" -s false
