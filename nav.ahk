#Requires AutoHotkey v2.0

#Include ./nav/pt_run.ahk

#SuspendExempt true
; Win + F11
#F11:: Reload()

; Ctrl + Win + K
^#k:: Suspend()
#SuspendExempt false

; vim-like keybindings in insert mode
; arrow shortcuts
CapsLock & h::left
CapsLock & k::up
CapsLock & j::down
CapsLock & l::right

CapsLock & g::Home
CapsLock & `;::End

; new line with comma end
CapsLock & Enter:: Send("{End},{Enter}")

; new line with semi-colon end
CapsLock & ':: Send("{End};{Enter}")

#HotIf WinActive("ahk_exe Obsidian.exe")

; ctrl+enter to make new line
; requires vim
; not using `{Esc}o` because `o` always makes a new blank line
; using `{Enter}` because it can continue bullet points, etc...
^Enter:: Send("{Esc}A{Enter}")

#HotIf