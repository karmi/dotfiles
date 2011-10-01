#!/bin/sh

DIR=$( dirname "$0" )

source "$DIR/__system_preferences.sh"
source "$DIR/__application_preferences.sh"

set_system_preferences
set_application_preferences

echo "System and Application Preferences were set"
