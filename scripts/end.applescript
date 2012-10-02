-- Enable "Notification Center" notifications and show notifications panel
tell application "System Events"
    tell process "Notification Center"
        key down option
        click first menu bar's first menu bar item
        key up option
		click first menu bar's first menu bar item
    end tell
end tell

-- Set "Messages" status to 'Available'
tell application "Messages"
    set status to available
end tell

-- Set "Skype" status to 'Online' and erase mood message
tell application "Skype"
  send command "SET USERSTATUS ONLINE" script name "pomodoro"
  send command "SET PROFILE MOOD_TEXT " script name "pomodoro"
end tell
