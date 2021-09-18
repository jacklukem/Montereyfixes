tell application "System Events"
	tell appearance preferences
		if dark mode is false then
			set dark mode to true
			do shell script "defaults write -g ASB_DarkMenuBar -bool false"
			do shell script "killall Finder"
			do shell script "killall ControlCenter"
		else
			set dark mode to false
			do shell script "defaults write -g ASB_DarkMenuBar -bool true"
			do shell script "killall Finder"
			do shell script "killall ControlCenter"
		end if
	end tell
end tell