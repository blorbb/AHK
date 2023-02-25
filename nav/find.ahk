CursorChangeKeys := "
(
{Esc}{Tab}{Enter}{Up}{Down}{Left}{Right}{LButton}{RButton}{MButton}{PgUp}{PgDn}{Ins}
)"

CharacterHook := InputHook("L1 B M", CursorChangeKeys)

WaitForNextChar() {
    CharacterHook.Start()
    CharacterHook.Wait()

    ; check that its a valid character
    if RegExMatch(CharacterHook.Input, ".") {
        return CharacterHook.Input
    }
    Exit()
}

MoveToNextChar(char, forward := true, IncludeChar := true, Select := false) {
    ; get contents of the line

    ; remember previous clipboard contents
    PrevClipboard := ClipboardAll()
    A_Clipboard := ""

    ; select text
    ; add an extra right/left as in some editors (VSCode)
    ; copying without a selection will copy the whole line
    ; additional left/right just adds a new line to the selection
    if forward {
        Send("+{End 2}+{Right}^c")
        Sleep(1)
        Send("{Left}")
    } else {
        Send("+{Home 2}+{Left}^c")
        Sleep(1)
        Send("{Right}")
    }

    if !ClipWait(1) {
        RestoreClipboardContents(&PrevClipboard)
        return
    }

    LineContent := A_Clipboard

    ; -1 for reverse, 1 for forward
    StartPos := forward ? 1 : -1
    CharPos := InStr(LineContent, char, true, StartPos)
    ; no match if 0
    if CharPos == 0 {
        RestoreClipboardContents(&PrevClipboard)
        return
    }

    ForwardAmount := CharPos - 1
    BackwardAmount := StrLen(LineContent) - ForwardAmount - 1

    MaybeHoldShift := Select ? "+" : ""

    ShiftToInclude := IncludeChar ? 1 : 0
    if forward {
        Send(MaybeHoldShift "{Right " ForwardAmount + ShiftToInclude "}")
    } else {
        Send(MaybeHoldShift "{Left " BackwardAmount + ShiftToInclude "}")
    }

    RestoreClipboardContents(&PrevClipboard)
}

RestoreClipboardContents(&Contents) {
    A_Clipboard := Contents
    ; free memory in case contents was very large
    Contents := ""
}

Find(Forward, IncludeChar) {
    ; hold shift when pressing the initial hotkey to select
    Select := false
    if GetKeyState("Shift") {
        Select := true
    }
    char := WaitForNextChar()
    MoveToNextChar(char, Forward, IncludeChar, Select)
}

; place cursor after the character, forwards
CapsLock & f:: Find(true, true)

; place cursor before the character, backwards
CapsLock & d:: Find(false, true)

; place cursor before the character, forwards
CapsLock & t:: Find(true, false)

; place cursor after the character, backwards
CapsLock & r:: Find(false, false)