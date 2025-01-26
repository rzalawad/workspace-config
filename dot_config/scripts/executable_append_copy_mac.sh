#!/bin/bash

osascript -e '
tell application "System Events"
    set the_app to name of the first application process whose frontmost is true
end tell


tell application the_app
    activate
end tell

tell application "System Events"
    set currentClipboard to (get the clipboard)
    keystroke "c" using command down
    delay 1
    set selectedText to (get the clipboard)

    set the_focus_app to the_app

    # display dialog the_app & ":" & selectedText

    set the clipboard to (currentClipboard & " " & selectedText)
end tell
'

