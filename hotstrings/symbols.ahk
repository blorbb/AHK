/**
 * shortcuts for symbols (not LaTeX syntax)
 */

; within other text | no end char needed | case sensitive
#Hotstring ? * C

; allow hotstrings to activate other hotstrings
#InputLevel 1

:X:--:: SendEvent("—")
::—-::---

:X:<=:: SendEvent("≤")
::≤>::⇔
::>=::≥
::=>::⇒

::->::→
::<-::←

:X:\!?:: SendEvent("‽")
::‽``::⸘

::⁻1::⁻¹


::ḻank::᲼    ; ::\blank:: not a space
::ḩeck::✓    ; ::\check::
::ẹg::°    ; ::\deg::
::\nothing::​    ; 0 width
::\shrug::¯\_(ツ)_/¯
::\sqrt::√
::d̆ot::˙    ; ::\udot::


; reset to default
#Hotstring ?0 *0 C0
#InputLevel 0