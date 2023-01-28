/**
 * LaTeX shortcuts for letters with special accents
 * 
 * uses unicode combining characters
 */

; allow to trigger other hotstrings
#InputLevel 2

; https://www.autohotkey.com/docs/v2/lib/InputHook.htm

; need `B` option to backspace the hotstring
/** for use with `CombineWithNextChar` function */
CharacterHook := InputHook("L1 B", "{BS}")

/**
 * adds a combining character to the next typed letter
 * 
 * generalises the format `::\"a::̈a`
 * - if the next letter is a space, just sends the combining character
 * - prefix MUST be 2 characters: backslash and prefix (e.g. `\"`, `\.`)
 * 
 * @param {String} combiningCharacter - the combining character to use.
 */
CombineWithNextChar(CombiningCharacter) {
    ; wait for another character to be pressed
    CharacterHook.Start()
    CharacterHook.Wait()

    ; character to add the combination to
    InputtedCharacter := CharacterHook.Input

    ; backspace pressed - remove the hotstring prefix
    if CharacterHook.EndKey == "Backspace"
        return

    ; ensure that it is a letter or space
    MatchPosition := RegExMatch(InputtedCharacter, "^[a-zA-Z ]$")
    ; matchPosition = 0 if there was no match
    if MatchPosition == 0 {
        Send(InputtedCharacter)
        return
    }

    ; there is a match: remove the hotstring and add the characters required
    Send("{BS 2}")
    ; if the inputted character is a space, just send the combining character
    if InputtedCharacter == " " {
        ; use `SendEvent` in case another hotstring uses the prefix
        SendEvent(CombiningCharacter)
        return
    }
    ; `inputtedCharacter` is a letter: send the inputted character and combining character
    SendEvent(InputtedCharacter CombiningCharacter)
}

; combining prefixes:
; https://en.wikibooks.org/wiki/LaTeX/Special_Characters#Escaped_codes

; within other text | no end char needed | case sensitive | do not auto backspace
#Hotstring ? * C B0
; can't put `X` in the #Hotstring directive

;#region [definitions] combining characters

; no clue why this doesn't work with :X:, gives an error
::\``::
{
    CombineWithNextChar("̀")    ; grave accent  U+0300 - ò
}
:X:\':: CombineWithNextChar("́")    ; acute accent  U+0301  ó
:X:\^:: CombineWithNextChar("̂")    ; circumflex    U+0302  ô
:X:\":: CombineWithNextChar("̈")    ; umlaut        U+0308  ö
:X:\H:: CombineWithNextChar("̋")    ; double acute  U+030B  ő
:X:\~:: CombineWithNextChar("̃")    ; tilde         U+0342  o͂
:X:\c:: CombineWithNextChar("̧")    ; cedilla       U+0327  o̧
:X:\k:: CombineWithNextChar("̨")    ; ogonek        U+0328  ǫ
:X:\=:: CombineWithNextChar("̄")    ; macron        U+0304  ō
:X:\b:: CombineWithNextChar("̱")    ; macron below  U+0331  o̱
:X:\.:: CombineWithNextChar("̇")    ; overdot       U+0307  ȯ
:X:\d:: CombineWithNextChar("̣")    ; underdot      U+0323  ọ
:X:\r:: CombineWithNextChar("̊")    ; overring      U+030A  o̊
:X:\u:: CombineWithNextChar("̆")    ; breve         U+0306  ŏ
:X:\v:: CombineWithNextChar("̌")    ; caron         U+030C  ǒ

; special case of `\r*`: `\aa` is the same as `\ra`
:B:\aa::å

; CUSTOM PREFIXES: NOT LaTeX
; \t* is usually a tie  U+0361  o͡o
; but it is barely used: tilde below can be used for vectors
:X:\t:: CombineWithNextChar("̰")    ; tilde below   U+0330  o̰

;#endregion

; reset to defaults for other included files
#Hotstring ?0 *0 C0 B
#InputLevel 0