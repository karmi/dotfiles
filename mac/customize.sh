#!/bin/sh

DIR=$( dirname "$0" )

source "$DIR/__system_preferences.sh"
source "$DIR/__application_preferences.sh"

echo "  → Customizing the OS..."
set_system_preferences
echo "  → Customizing applications..."
set_application_preferences

echo "✓ System and Application Preferences were set"
