#!/usr/bin/zsh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# GENERAL SETTINGS
## Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

## Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

## Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

## Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

## Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# TRACKPAD SETTINGS

## Set two fingers gestures (Zoom and Notification Center)
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadTwoFingerDoubleTapGesture -int 1;
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3;

## Use three fingers to drag and disable other swipes gestures
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerHorizSwipeGesture -bool false
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerVertSwipeGesture -bool false
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerTapGesture -bool false
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadThreeFingerDrag -int 1

## Use four fingers to swipe full screen apps and open launchpad
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFourFingerHorizSwipeGesture -int 2
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFourFingerVertSwipeGesture -int 2
sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFourFingerPinchGesture -int 2

sudo defaults write com.apple.AppleMultitouchTrackpad.plist TrackpadFiveFingerPinchGesture -int 2

# KEYBOARD SETTINGS
## Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

## Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -float 0.000000000001

## Set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool false

## Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "America/Sao_Paulo" > /dev/null

## Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

## Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# DOCK SETTINGS

## Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true
