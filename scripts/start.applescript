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

tell application "BreakTime"
  set enabled to not enabled
end tell
