#!/bin/sh

DIR=$( dirname "$0" )

source "$DIR/__system_preferences.sh"
source "$DIR/__application_preferences.sh"

echo "  → Customizing the OS..."
set_system_preferences
echo "  → Customizing applications..."
set_application_preferences

echo "  → Installing Terminal theme..."
open $HOME/dotfiles/mac/terminal/karmi.terminal
sleep 1
osascript -e 'tell application "Terminal" to set default settings to settings set "karmi"'
osascript -e 'tell application "Terminal" to set startup settings to settings set "karmi"'

echo "✓ System and Application Preferences were set"
