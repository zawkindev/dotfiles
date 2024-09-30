{ pkgs, ... }:

let
  # Define the i3 config content
  i3Config = ''
    set $mod Mod1
    font pango:CommitMono Nerd Font 16

    # class                 border  backgr. text    indicator child_border
    client.focused          #ffffff #000000 #ffffff #ffffff   #ffffff
    client.focused_inactive #333333 #5f676a #ffffff #484e50   #5f676a
    client.unfocused        #333333 #000000 #888888 #888888   #5f676a
    client.urgent           #2f343a #900000 #ffffff #900000   #900000
    client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c
    client.background       #000000

    # borders
    default_border pixel 1
    default_floating_border normal

    # change borders
    bindsym $mod+u border none
    bindsym $mod+y border pixel 1

    # Start XDG autostart .desktop files using dex.
    exec --no-startup-id dex --autostart --environment i3
    exec --no-startup-id picom -b
    exec --no-startup-id polybar

    # Volume control
    bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5%
    bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5%
    bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle

    # Screen brightness controls
    bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl set +5%
    bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl set 5%-

    # Audio controls
    bindsym XF86AudioPlay exec playerctl play-pause
    bindsym XF86AudioPause exec playerctl play-pause
    bindsym XF86AudioNext exec playerctl next
    bindsym XF86AudioPrev exec playerctl previous

    # NetworkManager
    exec --no-startup-id nm-applet
    exec --no-startup-id rfkill block bluetooth
    exec --no-startup-id feh --bg-fill ~/.config/wallpaper.jpg

    # Use Mouse+$mod to drag floating windows
    floating_modifier $mod

    # Start terminal
    bindsym $mod+Return exec alacritty

    # Kill focused window
    bindsym $mod+c kill

    # Start dmenu
    bindsym $mod+d exec --no-startup-id dmenu_run -p 'search:' -l 5 -sb "#eeeeee" -sf "#121212" -nb "#010101" -nf "#eeeeee" -fn "Code New Roman Nerd Font"

    # Focus and move windows
    bindsym $mod+h focus left
    bindsym $mod+j focus down
    bindsym $mod+k focus up
    bindsym $mod+l focus right
    bindsym $mod+Shift+h move left
    bindsym $mod+Shift+j move down
    bindsym $mod+Shift+k move up
    bindsym $mod+Shift+l move right

    # Fullscreen mode
    bindsym $mod+f fullscreen toggle

    # Container layout
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # Toggle tiling / floating
    bindsym $mod+Shift+space floating toggle

    # Resize windows
    mode "resize" {
       bindsym h resize shrink width 10 px or 10 ppt
       bindsym j resize grow height 10 px or 10 ppt
       bindsym k resize shrink height 10 px or 10 ppt
       bindsym l resize grow width 10 px or 10 ppt
       bindsym Return mode "default"
       bindsym Escape mode "default"
       bindsym $mod+r mode "default"
    }

    bindsym $mod+r mode "resize"

    # Gaps configuration
    gaps inner 10
    gaps outer -2
    gaps top 32

    set $mode_gaps Gaps: (o) outer, (i) inner
    mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0
        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0
        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
  '';

  colors = {
    background = "#00aaaaaa";
    background-alt = "#cc000000";
    foreground = "#000000";
    foreground-alt = "#ffffff";
    primary = "#F0C674";
    disabled = "#2a2a2a";
    alert = "#A54242";
  };

  polybarConfig = ''
    [colors]
    background = #00aaaaaa
    background-alt = #cc000000
    foreground = #000000
    foreground-alt = #ffffff
    primary = #F0C674
    disabled = #2a2a2a
    alert = #A54242
    
    [bar/example]
    width = 100%
    height = 24pt
    padding = 1
    
    offset-y = 5
    
    background = ${colors.background}
    foreground = ${colors.foreground}
    
    font-0 = "Commit Mono Nerd Font:size=14:weight=bold;3"
    font-1 = "Commit Mono Nerd Font:size=8;2"
    
    separator = " "
    
    modules-left = xworkspaces xwindow
    modules-center = date
    modules-right = filesystem backlight battery pulseaudio wlan
    
    cursor-click = pointer
    
    enable-ipc = true
    
    wm-restack = i3
    override-redirect = true
    [module/systray]
    type = internal/tray
    format-margin = 8pt
    tray-spacing = 16pt
    
    [module/xworkspaces]
    type = internal/xworkspaces
    label-active = %name%
    label-active-background = ${colors.background}
    label-active-foreground = ${colors.foreground-alt}
    label-active-padding = 1
    
    label-occupied = %name%
    label-occupied-padding = 1
    
    label-urgent = %name%
    label-urgent-background = ${colors.alert}
    label-urgent-padding = 1
    
    label-empty = %name%
    label-empty-padding = 1
    
    [module/xwindow]
    type = internal/xwindow
    label = %{T2} %{T-} %title:0:45:...%
    
    [module/filesystem]
    type = internal/fs
    interval = 25
    
    mount-0 = /
    
    label-mounted =  %percentage_used%%
    label-mounted-background = ${colors.background-alt}
    label-mounted-foreground = ${colors.foreground-alt}
    
    label-mounted-padding = 1
    
    [module/pulseaudio]
    type = internal/pulseaudio
    
    format-volume = 󰕾 <label-volume>
    format-volume-padding = 1
    
    format-volume-background = ${colors.background-alt}
    format-volume-foreground = ${colors.foreground-alt}
    
    label-volume = %percentage%%
    
    label-muted = 󰝟
    label-muted-padding=1
    label-muted-background = ${colors.background-alt}
    label-muted-foreground = ${colors.foreground-alt}
    
    [network-base]
    type = internal/network
    interval = 5
    format-connected = <label-connected>
    format-disconnected = <label-disconnected>
    label-disconnected = %{F#F0C674}%ifname%%{F#707880} disconnected
    
    [module/wlan]
    inherit = network-base
    interface-type = wireless
    label-connected = " 󰖩 %essid% "
    label-connected-background = ${colors.background-alt}
    label-connected-foreground = ${colors.foreground-alt}
    
    label-disconnected = " 󰖪 disconnected "
    label-disconnected-background = ${colors.background-alt}
    label-disconnected-foreground = ${colors.foreground-alt}
    
    [module/eth]
    inherit = network-base
    interface-type = wired
    label-connected = %{F#F0C674}%ifname%%{F-} %local_ip%
    
    [module/date]
    type = internal/date
    interval = 1
    
    date =  %a, %d %B%
    time =  %k:%M
    
    format = <label>
    
    label = %time% | %date%
    
    label-background = ${colors.background}
    label-foreground = ${colors.foreground}
    label-padding = 1
    
    [module/backlight]
    type = internal/backlight
    card = intel_backlight
    
    use-actual-brightness = true
    enable-scroll = true
    
    format =<ramp><label>
    format-background = ${colors.background-alt}
    format-foreground = ${colors.foreground-alt}
    
    format-padding = 1
    
    label = %percentage%% 
    
    ramp-0 = "󰃞 "
    ramp-1 = "󰃟 "
    ramp-2 = "󰃠 "
    
    [module/battery]
    type = internal/battery
    full-at = 99
    time-format = %H:%M
    battery = BAT0
    adapter = ACAD
    format-charging = <animation-charging><label-charging>
    label-charging = %percentage%%
    format-discharging = <ramp-capacity><label-discharging>
    label-discharging = %percentage%%
    format-full = "<label-full> "
    format-full-prefix = " 󰁹 "
    ramp-capacity-0 = " 󰁺"
    ramp-capacity-1 = " 󰁻"
    ramp-capacity-2 = " 󰁼"
    ramp-capacity-3 = " 󰁽"
    ramp-capacity-4 = " 󰁾"
    ramp-capacity-5 = " 󰁿"
    ramp-capacity-6 = " 󰂀"
    ramp-capacity-7 = " 󰂁"
    ramp-capacity-8 = " 󰂂"
    
    animation-charging-0 = "󰢜 "
    animation-charging-1 = "󰢝 "
    animation-charging-2 = "󰂅 "
    
    animation-charging-framerate = 750
    label-discharging-padding = 1
    format-charging-padding = 1
    
    animation-charging-foreground = ${colors.foreground-alt}
    format-charging-background = ${colors.background-alt}
    label-charging-foreground = ${colors.foreground-alt}
    format-discharging-background = ${colors.background-alt}
    label-discharging-foreground = ${colors.foreground-alt}
    format-full-background = ${colors.background-alt}
    format-full-foreground = ${colors.foreground-alt}
    ramp-capacity-foreground   = ${colors.foreground-alt}
    
    [settings]
    screenchange-reload = true
    pseudo-transparency = true
  '';
  
in
  {
    # Install the i3 window manager
  home.packages = with pkgs; [
    i3-gaps
    alacritty
    alsa-utils
    picom
    polybar
    networkmanagerapplet  #nm-applet
    dex
    brightnessctl
    playerctl
    feh
    dmenu
  ];

  # Write the i3 config to the appropriate location
  # home.file = {
  #   ".config/i3/config".text = i3Config;
  #   ".config/polybar/config.ini".text = polybarConfig;
  # };


  services.polybar = {
    enable = true;
    extraConfig = polybarConfig;
    script = "polybar &";
  };

  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = i3Config;
  };

  # Set the XDG autostart
#  home.sessionVariables.XDG_CURRENT_DESKTOP = "i3";
}
