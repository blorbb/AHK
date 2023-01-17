; space underneath each line
LINE_PADDING := "3"
; what to put between each key and value
SEPARATOR := " - "
; time in seconds to wait for Powertoys Run to open
; usually takes ~ 0.2s on my computer
TIMEOUT_DURATION := 0.5
TEXT_MAP := Map(
    "Files and Folders", "?",
    "Unit converter", "`%`%",
    "Settings", "$",
    "Shell", ">",
    "Programs", ".",
    "URL", "??",
    "VS Workspaces", "{",
    "Time and Date", ")",
    ; time zones is &, use && to escape it instead of `&
    "Time Zones", "&&",
)
; hex colors
BACKGROUND_COLOR := "171717"
TEXT_COLOR := "d8dce0"
PREFIX_COLOR := "fcbc88"

global Tip := Gui()
BuildTip()

global RunIsOpen := false

; open run: Alt + Space
~!Space::
{
    ; let previous instance close
    ; if pressing Alt+Enter twice
    Sleep(1)
    ; WinWait returns 0 if timed out
    global RunIsOpen := (WinWait("ahk_exe PowerToys.PowerLauncher.exe", , TIMEOUT_DURATION) != 0)

    if RunIsOpen {
        GetMovePositions(Tip.Hwnd, &Left, &Top, &Right, &Bottom)

        ; ! change position of the gui here
        ; use Left/Right, Top/Bottom
        Tip.Move(Left, Top)

        Tip.Show("NoActivate")
    } else {
        Tip.Hide()
    }
}

#HotIf RunIsOpen
~LButton::
~RButton::
~MButton::
~Enter::
~Esc::
{
    Tip.Hide()
    global RunIsOpen := false
}
#HotIf

BuildTip() {
    Tip.Opt("+AlwaysOnTop -Caption +ToolWindow +Border")

    ; color isn't really used, just a backup
    Tip.SetFont("s10 cRed")
    ; set fonts: order from least to most preferred
    Tip.SetFont(, "monospace")
    Tip.SetFont(, "Courier New")
    Tip.SetFont(, "Lucida Sans Typewriter")
    Tip.SetFont(, "Fira Code")
    Tip.SetFont(, "Fira Mono")

    Tip.BackColor := BACKGROUND_COLOR

    MaxKeyLength := GetMaxKeyLength(TEXT_MAP)
    for key, value in TEXT_MAP {
        LeftPadding := MaxKeyLength - StrLen(key)
        PaddedText := StringRepeat(" ", LeftPadding) key
        ; xm is relative to the window margins
        Tip.Add("Text", "c" TEXT_COLOR " xm y+" LINE_PADDING, PaddedText SEPARATOR)
        ; yp is relative to top
        Tip.Add("Text", "c" PREFIX_COLOR " x+0 yp", value)
    }
}

GetMaxKeyLength(Map) {
    MaxLength := 0
    for Key in Map {
        if StrLen(Key) > MaxLength {
            MaxLength := StrLen(Key)
        }
    }
    return MaxLength
}

StringRepeat(Text, Count) {
    Result := ""
    loop Count {
        Result .= Text
    }
    return Result
}

/**
 * Gets the screen coordinates to move the Gui to,
 * accounting for the current active monitor
 * and Gui width/height
 */
GetMovePositions(GuiHwnd, &Left, &Top, &Right, &Bottom) {

    WinGetPos(, , &Width, &Height, GuiHwnd)

    ActiveMonitor := GetActiveMonitor()
    MonitorGetWorkArea(ActiveMonitor, &MonitorLeft, &MonitorTop, &MonitorRight, &MonitorBottom)

    ; 96 DPI = 100%
    Scale := A_ScreenDPI / 96

    Left := MonitorLeft / Scale
    Right := (MonitorRight - Width) / Scale
    Top := MonitorTop / Scale
    Bottom := (MonitorBottom - Height) / Scale
}

/**
 * Returns the monitor number that the mouse is in
 */
GetActiveMonitor() {
    ; get screen coordinates of the mouse
    CoordMode("Mouse", "Screen")
    MouseGetPos(&MouseX, &MouseY)

    MonitorCount := MonitorGetCount()
    N := 1
    loop MonitorCount {
        MonitorGet(N, &Left, &Top, &Right, &Bottom)
        ; check that the mouse position is within these coordinates
        WithinMonitorHorizontal := Left <= MouseX and MouseX < Right
        WithinMonitorVertical := Top <= MouseY and MouseY < Bottom
        if WithinMonitorHorizontal and WithinMonitorVertical {
            return N
        }
        N += 1
    }
}