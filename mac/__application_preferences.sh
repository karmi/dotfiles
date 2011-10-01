# Settings copied from:
#
# <https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh>
#
#

function set_application_preferences () {

  ## System / Library / CoreServices / Finder

  /usr/bin/defaults write com.apple.finder 'PreferencesWindow.LastSelection' -string 'SDBR'

  /usr/bin/defaults write com.apple.finder 'NewWindowTarget' -string 'PfHm'

  /usr/bin/defaults write com.apple.finder 'WarnOnEmptyTrash' -bool false
  /usr/bin/defaults write com.apple.finder 'FXEnableExtensionChangeWarning' -bool false

  /usr/bin/defaults write com.apple.finder 'FinderSounds' -bool false

  /usr/bin/defaults write com.apple.finder 'AnimateInfoPanes' -bool false
  /usr/bin/defaults write com.apple.finder 'AnimateWindowZoom' -bool false
  /usr/bin/defaults write com.apple.finder 'DisableAllAnimations' -bool true

  /usr/bin/defaults write NSGlobalDomain 'NSAutomaticWindowAnimationsEnabled' -bool false

  /usr/bin/defaults write com.apple.desktopservices 'DSDontWriteNetworkStores' -bool true

  /usr/bin/defaults write com.apple.finder 'FXPreferredGroupBy' -string 'Date Added'

  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ExtendedListViewSettings:calculateAllSizes" bool'
  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ExtendedListViewSettings:calculateAllSizes" bool true'

  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ExtendedListViewSettings:useRelativeDates" bool'
  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ExtendedListViewSettings:useRelativeDates" bool false'

  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ListViewSettings:calculateAllSizes" bool'
  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ListViewSettings:calculateAllSizes" bool true'

  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Delete "StandardViewSettings:ListViewSettings:useRelativeDates" bool'
  /usr/libexec/PlistBuddy "$HOME/Library/Preferences/com.apple.finder.plist" -c 'Add "StandardViewSettings:ListViewSettings:useRelativeDates" bool false'

  # Make ~/Library visible
  /usr/bin/chflags nohidden $HOME/Library

  # [!] Reload Finder
  /usr/bin/sudo /usr/bin/killall Finder

  ## Applications / iTunes

  /usr/bin/defaults write com.apple.iTunes 'disablePing' -bool true
  /usr/bin/defaults write com.apple.iTunes 'hide-ping-dropdown' -bool true

  /usr/bin/defaults write com.apple.iTunes 'show-store-link-arrows' -bool true
  /usr/bin/defaults write com.apple.iTunes 'invertStoreLinks' -bool true


  ## Applications / iWork

  /usr/bin/defaults write com.apple.iWork.Keynote 'ShowStartingPointsForNewDocument' -bool false
  /usr/bin/defaults write com.apple.iWork.Keynote 'dontShowWhatsNew' -bool true
  /usr/bin/defaults write com.apple.iWork.Keynote 'FirstRunFlag' -bool true

  /usr/bin/defaults write com.apple.iWork.Numbers 'ShowStartingPointsForNewDocument' -bool false
  /usr/bin/defaults write com.apple.iWork.Numbers 'dontShowWhatsNew' -bool true
  /usr/bin/defaults write com.apple.iWork.Numbers 'FirstRunFlag' -bool true

  /usr/bin/defaults write com.apple.iWork.Pages 'ShowStartingPointsForNewDocument' -bool false
  /usr/bin/defaults write com.apple.iWork.Pages 'dontShowWhatsNew' -bool true
  /usr/bin/defaults write com.apple.iWork.Pages 'FirstRunFlag' -bool true


  ## Applications / Mail

  # /usr/bin/defaults write com.apple.mail 'PreferPlainText' -bool true
  /usr/bin/defaults write com.apple.mail 'DisableReplyAnimations' -bool true
  /usr/bin/defaults write com.apple.mail 'DisableSendAnimations' -bool true

  ## Applications / Safari

  /usr/bin/defaults write com.apple.Safari 'ShowStatusBar' -bool true

    ### Applications / Safari > General

    /usr/bin/defaults write com.apple.Safari 'NewWindowBehavior' -int 1
    /usr/bin/defaults write com.apple.Safari 'NewTabBehavior' -int 1
    /usr/bin/defaults write com.apple.Safari 'HomePage' -string ''
    /usr/bin/defaults write com.apple.Safari 'AutoOpenSafeDownloads' -bool false

    ### Applications / Safari > Tabs

    /usr/bin/defaults write com.apple.Safari 'TabCreationPolicy' -int 1
    /usr/bin/defaults write com.apple.Safari 'OpenExternalLinksInExistingWindow' -bool true

    ### Applications / Safari > Advanced

    /usr/bin/defaults write com.apple.Safari 'IncludeDevelopMenu' -bool true

  ## Utilities / Disk Utility

  /usr/bin/defaults write com.apple.DiskUtility 'DUDebugMenuEnabled' -bool true

}
