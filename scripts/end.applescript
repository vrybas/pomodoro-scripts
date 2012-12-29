tell application "System Events"
    tell process "Notification Center"
        key down option
        click first menu bar's first menu bar item
        key up option
		click first menu bar's first menu bar item
    end tell
end tell

tell application "Messages"
    set status to available
end tell

tell application "Skype"
  send command "SET USERSTATUS ONLINE" script name "pomodoro"
  send command "SET PROFILE MOOD_TEXT " script name "pomodoro"
end tell

do shell script "curl -u au8th0rizat0iont090o0ken:X -H 'Content-Type: application/json' -d '{\"message\":{\"body\":\"Available.\"}}' https://subdomain.campfirenow.com/room/1234/speak.json"

