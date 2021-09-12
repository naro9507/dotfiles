#!/bin/zsh


# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for dir in $(\ls -F | grep setting/ | awk '{print substr($0, 1, length($0)-1)}'); do
    for file in $(\find ./${dir} -name \*.zsh); do
        $file
    done
    echo "${dir} setup is complete!"
done

for app in "Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"iCal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."