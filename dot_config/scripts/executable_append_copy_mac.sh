#!/bin/bash

osascript -e '
tell application "System Events"
    set currentClipboard to (get the clipboard)
    keystroke "c" using command down
    delay 0.3
    set selectedText to (get the clipboard)

    set the clipboard to (currentClipboard & " " & selectedText)
end tell
'
