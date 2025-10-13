#!/bin/bash

# Rofi Power Menu für i3 mit Cinnamon Screensaver

options="Lock\nSuspend\nHibernate\nLogout\nReboot\nShutdown"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme-str 'window {width: 250px;} * {font: "JetBrains Mono 14";} listview {lines: 6; spacing: 0px;} element {padding: 5px;}')

case $chosen in
    "Lock")
        cinnamon-screensaver-command --lock
        ;;
    "Suspend")
        cinnamon-screensaver-command --lock && systemctl suspend
        ;;
    "Hibernate")
        cinnamon-screensaver-command --lock && systemctl hibernate
        ;;
    "Logout")
        i3-msg exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac
