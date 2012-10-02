-- Disable "Notification Center" notifications
tell application "System Events"
    tell process "Notification Center"
        key down option
        click first menu bar's first menu bar item
        key up option
    end tell
end tell

-- Set "Messages" status to 'Away' with status message
tell application "Messages"
    set status to away
    set status message to "Busy. Available in $duration min. Leave a message or use oDesk Team Chat"
end tell

-- Set "Skype" status to 'Do Not Disturb' with mood message
tell application "Skype"
    send command "SET USERSTATUS DND" script name "pomodoro"
    send command "SET PROFILE MOOD_TEXT Busy. Available in $duration min. Leave a message or use oDesk Team Chat" script name "pomodoro"
end tell
