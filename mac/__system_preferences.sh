# Settings copied from:
#
# <https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh>
#
#

function set_system_preferences () {
# System Preferences

  ## System Preferences > General

    ### Appearance: Graphite
    /usr/bin/defaults write -g 'AppleAquaColorVariant' -int 6

    ### Sidebar icon size: Small
    /usr/bin/defaults write -g 'NSTableViewDefaultSizeMode' -int 1

    # <http://twitter.com/siracusa/statuses/95240123494572032>
    /usr/bin/defaults write -g 'NSAutomaticWindowAnimationsEnabled' -bool false

  ## System Preferences > Dock

    ### Size: 32 pixels
    /usr/bin/defaults write com.apple.dock 'tilesize' -int 36

    ### Magnification: off, 64 pixels
    /usr/bin/defaults write com.apple.dock 'magnification' -bool false
    /usr/bin/defaults write com.apple.dock 'largesize' -int 64

    ### Position on screen: Left
    /usr/bin/defaults write com.apple.dock 'orientation' -string 'right'

    ### Minimize windows using: Scale effect
    /usr/bin/defaults write com.apple.dock 'mineffect' -string 'scale'


  ## System Preferences > Mission Control

    ### Show Dashboard as a space
    /usr/bin/defaults write com.apple.dock 'dashboard-in-overlay' -bool true

  ## System Preferences > Displays > Display

    ### Automatically adjust brightness: off
    /usr/bin/defaults write com.apple.BezelServices 'dAuto' -bool false

  ## System Preferences > Keyboard > Keyboard

    ### Automatically illuminate keyboard in low light: on
    /usr/bin/defaults write com.apple.BezelServices 'kDim' -bool true

    ### Turn off when computer is not used for: 1 min
    /usr/bin/defaults write com.apple.BezelServices 'kDimTime' -int 60

  ## System Preferences > Sound

    ### Select an alert sound: Uh Oh
    /usr/bin/defaults write com.apple.systemsound 'com.apple.sound.beep.sound' -string '/System/Library/Sounds/Uh Oh.aiff'

    ### Play user interface sound effects
    /usr/bin/defaults write com.apple.systemsound 'com.apple.sound.uiaudio.enabled' -int 0

    ### FIXME: Play feedback when volume is changed
    /usr/bin/defaults write -g 'com.apple.sound.beep.feedback' -bool false

  ## System Preferences > Time Machine

    ### Time Machine: off
    /usr/bin/defaults write com.apple.TimeMachine 'AutoBackup' -bool false

}
