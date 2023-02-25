#Requires AutoHotkey v2.0

#Include ./nav/pt_run.ahk
#Include ./nav/find.ahk

#SuspendExempt true
; Win + F11
#F11:: Reload()

; Ctrl + Win + K
^#k:: Suspend()
#SuspendExempt false

; arrow shortcuts
CapsLock & j::left
CapsLock & i::up
CapsLock & k::down
CapsLock & l::right

CapsLock & h::Home
CapsLock & `;::End

; new line with comma end
CapsLock & Enter:: Send("{End},{Enter}")

; new line with semi-colon end
CapsLock & ':: Send("{End};{Enter}")

#HotIf WinActive("ahk_exe Obsidian.exe")

; ctrl+enter to make new line
^Enter:: 
{
    Send("{End}{End}")
    Sleep(1)
    Send("{Enter}")
}

#HotIf