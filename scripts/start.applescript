tell application "System Events"
    tell process "Notification Center"
        key down option
        click first menu bar's first menu bar item
        key up option
    end tell
end tell

delay 1

tell application "Messages"
    set status to away
    set status message to "Busy. Available in $duration min. Leave a message"
end tell

delay 1

tell application "Skype"
    send command "SET USERSTATUS DND" script name "pomodoro"
    send command "SET PROFILE MOOD_TEXT Busy. Available in $duration min. Leave a message" script name "pomodoro"
end tell

delay 1

set theDate to (current date)
tell application "Calendar"
    tell calendar "Work"
        set timeString to time string of theDate
        set newEvent to make new event at end with properties { description:"", summary:"$pomodoroName", location:"", start date:theDate, end date:theDate + $duration * minutes, allday event:false, status:confirmed}
        tell newEvent
            delete every display alarm
            delete every sound alarm
            delete every mail alarm
            delete every open file alarm
        end tell
    end tell
end tell

delay 1

tell application "oDesk Team" to activate
tell application "System Events"
	tell process "oDesk Team"
		click menu item "Memo..." of menu "Status" of menu bar 1
		delay 1
		tell application "System Events" to keystroke tab
		tell application "System Events" to keystroke "$pomodoroName"
		delay 1
		click button "OK" of window "oDesk Team - Memo"
	end tell
end tell

delay 1

tell application "BreakTime"
  set enabled to not enabled
end tell

delay 1

tell application "BreakTime"
  set enabled to not enabled
end tell

delay 1

do shell script "curl -u au8th0rizat0iont090o0ken:X -H 'Content-Type: application/json' -d '{\"message\":{\"body\":\"Working on *$pomodoroName*. Available in $duration min.\"}}' https://subdomain.campfirenow.com/room/1234/speak.json"
