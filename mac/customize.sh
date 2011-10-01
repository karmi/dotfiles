#!/bin/sh

DIR=$( dirname "$0" )

source "$DIR/__system_preferences.sh"
source "$DIR/__application_preferences.sh"

echo "  → Customizing the OS..."
set_system_preferences
echo "  → Customizing applications..."
set_application_preferences

if [ ! -d "$HOME/Fonts/Meslo LG DZ v1.0" ]; then
  echo "  → Installing the Meslo typeface..."
  curl -# -o /tmp/Meslo.zip -L -k http://github.com/downloads/andreberg/Meslo-Font/Meslo%20LG%20DZ%20v1.0.zip
  open -W /tmp/Meslo.zip
  cp -r "/tmp/Meslo LG DZ v1.0" $HOME/Fonts
fi

echo "  → Installing Terminal theme..."
open $HOME/dotfiles/mac/terminal/karmi.terminal
sleep 1
osascript -e 'tell application "Terminal" to set default settings to settings set "karmi"'
osascript -e 'tell application "Terminal" to set startup settings to settings set "karmi"'

echo "✓ System and Application Preferences were set"
