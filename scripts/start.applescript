tell application "System Events"
    tell process "Notification Center"
        key down option
        click first menu bar's first menu bar item
        key up option
    end tell
end tell

tell application "Messages"
    set status to away
    set status message to "Busy. Available in $duration min. Leave a message or use oDesk Team Chat"
end tell

tell application "Skype"
    send command "SET USERSTATUS DND" script name "pomodoro"
    send command "SET PROFILE MOOD_TEXT Busy. Available in $duration min. Leave a message or use oDesk Team Chat" script name "pomodoro"
end tell

set theDate to (current date)
tell application "Calendar"
    tell calendar "Work"        
        set timeString to time string of theDate
        set newEvent to make new event at end with properties { description:"", summary:"Pomodoro", location:"", start date:theDate, end date:theDate + $duration * minutes, allday event:false, status:confirmed}
        tell newEvent
            delete every display alarm
            delete every sound alarm
            delete every mail alarm
            delete every open file alarm
        end tell        
    end tell
end tell
