tell application "Messages"
        set status message to "Busy. Available in $time min. Leave a message or use oDesk Team Chat"
end tell

tell application "Skype"
        send command "SET PROFILE MOOD_TEXT Busy. Available in $time min. Leave a message or use oDesk Team Chat" script name "pomodoro"
end tell
