#!/bin/sh

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable auto-corrct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 0

# Disabling press-and-hold for special keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
 
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true &&
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true &&
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true &&
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true &&
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true &&
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true &&
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Adding a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Rename computer
echo "Would you like to set your computer name (as done via System Preferences >> Sharing)?  (y/n)"
read -r response
case $response in
  [yY])
      echo "What would you like it to be?"
      read COMPUTER_NAME
      sudo scutil --set ComputerName $COMPUTER_NAME
      sudo scutil --set HostName $COMPUTER_NAME
      sudo scutil --set LocalHostName $COMPUTER_NAME
      sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
      break;;
  *) break;;
esac

# Removing duplicates in the 'Open With' menu
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Disable local Time Machine snapshots
sudo tmutil disablelocal

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

# Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Setting trackpad & mouse speed to a reasonable number
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
 
# Turn off keyboard illumination when computer is not used for 2 minute
defaults write com.apple.BezelServices kDimTime -int 120

# Requiring password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Allowing text selection in Quick Look/Preview in Finder by default
defaults write com.apple.finder QLEnableTextSelection -bool true

# Enabling snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 36

# Speeding up Mission Control animations and grouping windows by application
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

# Set Dock to auto-hide and remove the auto-hiding delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

killall Finder









