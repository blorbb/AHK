#Requires AutoHotkey v2.0

/**
 * if a hotstring can activate others:
 * Set InputLevel to 1 `#InputLevel 1` and use SendEvent `:X:...::SendEvent("...")`
 */

#HotIf not WinActive("ahk_exe Code.exe")

#Include ./hotstrings/combinations.ahk
#Include ./hotstrings/fonts.ahk
#Include ./hotstrings/symbols.ahk
#Include ./hotstrings/LaTeX.ahk

#HotIf

#SuspendExempt true
; Win + F12
#F12:: Reload()

; Ctrl + Win + L
^#l:: Suspend()
#SuspendExempt false
