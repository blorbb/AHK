# AHK Scripts

A set of hotstrings for typing special unicode characters, plus some convenience hotkeys.

- The main scripts are at the top level, `hotstrings.ahk` and `nav.ahk`.
- Sub-scripts that each main script includes are in the folder of the same name.


## Installation

Click the `<> Code` button at the top right of this page, then click Download ZIP. Extract its contents in any folder.
- **AHK script**: for the ability to configure the scripts yourself, download [AHK v2](https://www.autohotkey.com/v2/) then run the scripts at the top level.
  - To customise which scripts are enabled, simply change the files included at the top of `hotstrings.ahk` with `#Include`.
- **Executable**: if you don't want to download AutoHotkey, you can also run the `.exe` files.


### Launch at Startup

(Windows) To start the scripts upon rebooting your computer, go to `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp` and put a shortcut to the script in there. Note that admin permissions are required.



## `hotstrings.ahk`

A bunch of hotstrings that provide easy access to unicode characters. Most of the notation is based on [LaTeX](https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols).
- Toggle suspend with <kbd>Ctrl</kbd> <kbd>Win</kbd> <kbd>L</kbd>
- Reload with <kbd>Win</kbd> <kbd>F12</kbd>
- By default, this script is disabled when VSCode is open. Remove or change this at the line `#HotIf not WinActive("ahk_exe Code.exe")` in `hotstrings.ahk`
- No ending character is required for hotstrings to be converted. This also means that hotstrings that contain other hotstrings will contain special characters. See: [LaTeX.ahk](#latexahk)


### `combinations.ahk`

Shortcuts for combining characters. Includes the custom `\t` to create an undertilde. Usually in LaTeX, this creates a tie, however this doesn't seem as useful as an undertilde.
Activate the hotstring by entering a character after each prefix. (e.g. `\.a` for `ȧ`)

| Prefix | Output | Name         | Unicode  |
| ------ | ------ | ------------ | -------- |
| `\'`   | ó      | Acute Accent | `U+0301` |
| `\^`   | ô      | Circumflex   | `U+0302` |
| `\"`   | ö      | Umlaut       | `U+0308` |
| `\H`   | ő      | Double Acute | `U+030B` |
| `\~`   | o͂      | Tilde        | `U+0342` |
| `\t`   | o̰      | Tilde Below  | `U+0330` |
| `\c`   | o̧      | Cedilla      | `U+0327` |
| `\k`   | ǫ      | Ogonek       | `U+0328` |
| `\=`   | ō      | Macron       | `U+0304` |
| `\b`   | o̱      | Macron Below | `U+0331` |
| `\.`   | ȯ      | Overdot      | `U+0307` |
| `\d`   | ọ      | Underdot     | `U+0323` |
| `\r`   | o̊      | Overring     | `U+030A` |
| `\u`   | ŏ      | Breve        | `U+0306` |
| `\v`   | ǒ      | Caron        | `U+030C` |


### `fonts.ahk`

Shortcuts to create superscript (`^`), subscript (`_`), blackboard math (`\mbb`), fraktur (`\mfrak`) and calligraphic (`\mcal`). `\mbb`, `\mfrak` and `\mcal` are usually `\mathbb`, `\mathfrak` and `\mathcal` respectively, but they have been shortened for convenience.
Multiple characters can also be converted by adding a curly brace after the prefix (e.g. `\mbb{text}`). Characters will be converted when the brace is closed or right arrow is pressed, assuming that there is auto-closing brackets.


### `symbols.ahk`

Some custom symbols to easily type, such as `≥` (`>=`) etc. Not part of LaTeX.


### `LaTeX.ahk`

LaTeX symbols. Hotstring to send the symbol is the same as the LaTeX syntax.


## `nav.ahk`

Some hotkeys to quickly navigate around using the keyboard.
- Toggle suspend with <kbd>Ctrl</kbd> <kbd>Win</kbd> <kbd>K</kbd>
- Reload with <kbd>Win</kbd> <kbd>F11</kbd>


### `pt_run.ahk`

Creates a tooltip for the prefixes used in [PowerToys Run](https://learn.microsoft.com/en-gb/windows/powertoys/run) when it's active.
- Activate using <kbd>Alt</kbd> <kbd>␣</kbd> (Space) (Default hotkey to open PowerToys Run).
- Many settings (including the contents) can be changed at the top of `pt_run.ahk`
- Supports multiple monitors
- Change the position of the tooltip at the line with the comment `; ! change position of the gui here`, `Tip.Move(X, Y)`
  - Default is `Left, Top`, but arguments can also be changed to `Right` and `Bottom`
  - Place the tooltip in the middle horizontally/vertically with `(Left+Right)/2` or `(Top+Bottom)/2` respectively.
- Note: for some reason, when activating the hotkey for the first time after reloading, the tooltip is placed in the center of the primary monitor. Not sure why this happens. Fixed the next time the hotkey is activated.


## Adding your own hotstrings

Because hotstrings are activated without an ending character, hotstrings need to be able to activate other hotstrings. This is enabled by setting the `#InputLevel` to `1`, and using `SendEvent(Text)`. All hotstrings can have `#InputLevel 1`. 
- Let a hotstring activate other hotstrings with `:X:\hotstring:: SendEvent("symbol")`.
- Otherwise, just use `::\hotstring::symbol`. Double check that this doesn't cause any other hotstrings to stop working.

**Still todo:** (not important)

- Stop the long font hotstrings from activating when a mouse button is pressed.
- Stop the combination hotstrings from activating when a mouse button is pressed.
- Fix PowerToys Run tooltip being at the centre on first activation.