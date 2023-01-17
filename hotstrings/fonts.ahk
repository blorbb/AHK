/**
 * mbb, mcal etc fonts
 * also includes superscript/subscript
 */

#Include "fonts_maps.ahk"

/** keys that change the cursor position */
CursorChangeKeys := "
(
{Esc}{Tab}{Enter}{Up}{Down}{Left}{Right}{LButton}{RButton}{MButton}{PgUp}{PgDn}{Ins}
)"

InnerStringHook := InputHook("V", "{}}" CursorChangeKeys)

/**
 * gets everything inside braces and maps the characters
 * 
 * WARNING: mostly stops when the cursor changes,
 * however it does not handle mouse buttons
 * 
 * Also accepts pressing right arrow as an endkey,
 * assuming there are auto-closing brackets
 */
LongHotstring(CharMap) {
    ; wait for an endkey
    InnerStringHook.Start()
    InnerStringHook.Wait()

    Input := InnerStringHook.Input
    EndKey := InnerStringHook.EndKey

    ; some other cursor-changing button was pressed - do not do anything
    if not (EndKey == "}" || EndKey == "Right")
        return

    PrefixLength := StrLen(GetInitiatingHotstring(A_ThisHotkey))
    InputLength := StrLen(Input)

    ; +1 for the ending }
    BackspaceAmount := PrefixLength + InputLength + 1

    ; remove the inputted text
    Send("{BS " BackspaceAmount "}")

    ; ! not sure if this is needed
    ; if pressed `{` (shift+[), shift might still be down
    ; KeyWait("Shift")

    ; send mapped text
    Chars := StrSplit(Input)
    for Char in Chars {
        ; if no match found, just send that character
        Send(CharMap.Get(Char, Char))
    }
}

;#region [helper]
GetInitiatingHotstring(ThisHotstring) {
    ; A_ThisHotkey = :X:\mbb{
    ; get substring after the :X:

    ; position of second `:`
    ; can't assume its at index 2 as there may be other hotstring options
    TubstrStart := InStr(ThisHotstring, ":", , , 2)
    ; get everything after the second `:`
    Hotstr := SubStr(ThisHotstring, TubstrStart + 1)

    return Hotstr
}
;#endregion

; within other text | no end char needed | case sensitive | no auto backspace
#Hotstring ? * C B0

:X:\mbb{:: LongHotstring(mbbMap)
:X:\mfrak{:: LongHotstring(mfrakMap)
:X:\mcal{:: LongHotstring(mcalMap)

:X:^{:: LongHotstring(superscriptMap)
:X:_{:: LongHotstring(subscriptMap)

#Hotstring B

;#region [definitions] single character shortcuts: sub/superscript

::^(::⁽
::^)::⁾
::^+::⁺
; for one other shortcut: ::^-1::
#InputLevel 1
:X:^-:: SendEvent("⁻")
#InputLevel 0
::^0::⁰
::^1::¹
::^2::²
::^3::³
::^4::⁴
::^5::⁵
::^6::⁶
::^7::⁷
::^8::⁸
::^9::⁹
::^=::⁼
::^A::ᴬ
::^B::ᴮ
::^D::ᴰ
::^E::ᴱ
::^G::ᴳ
::^H::ᴴ
::^I::ᴵ
::^J::ᴶ
::^K::ᴷ
::^L::ᴸ
::^M::ᴹ
::^N::ᴺ
::^O::ᴼ
::^P::ᴾ
::^R::ᴿ
::^T::ᵀ
::^U::ᵁ
::^V::ⱽ
::^W::ᵂ

#InputLevel 1
:X:^a:: SendEvent("ᵃ")
:X:^b:: SendEvent("ᵇ")
:X:^c:: SendEvent("ᶜ")
:X:^d:: SendEvent("ᵈ")
:X:^e:: SendEvent("ᵉ")
:X:^f:: SendEvent("ᶠ")
:X:^g:: SendEvent("ᵍ")
:X:^h:: SendEvent("ʰ")
:X:^i:: SendEvent("ⁱ")
:X:^j:: SendEvent("ʲ")
:X:^k:: SendEvent("ᵏ")
:X:^l:: SendEvent("ˡ")
:X:^m:: SendEvent("ᵐ")
:X:^n:: SendEvent("ⁿ")
:X:^o:: SendEvent("ᵒ")
:X:^p:: SendEvent("ᵖ")
:X:^r:: SendEvent("ʳ")
:X:^s:: SendEvent("ˢ")
:X:^t:: SendEvent("ᵗ")
:X:^u:: SendEvent("ᵘ")
:X:^v:: SendEvent("ᵛ")
:X:^w:: SendEvent("ʷ")
:X:^x:: SendEvent("ˣ")
:X:^y:: SendEvent("ʸ")
:X:^z:: SendEvent("ᶻ")
#InputLevel 0

::ᵃlpha::ᵅ
::ᵇeta::ᵝ
::ᶜhi::ᵡ
::ᵈelta::ᵟ
::ᵉpsilon::ᵋ
::ᵍamma::ᵞ
::ⁱota::ᶥ
::ᵖhi::ᶲ
::ᵗheta::ᶿ
::ᵛarphi::ᵠ

; require ending char
; underscores are often used
; avoid needing to suspend hotkeys to use them
#Hotstring *0
; default EndChars with `+` and `=`
#Hotstring EndChars -()[]{}':;"/\,.?!`n `t+=
::_(::₍
::_)::₎
::_+::₊
::_-::₋
::_0::₀
::_1::₁
::_2::₂
::_3::₃
::_4::₄
::_5::₅
::_6::₆
::_7::₇
::_8::₈
::_9::₉
::_=::₌
::_beta::ᵦ
::_chi::ᵪ
::_gamma::ᵧ
::_rho::ᵨ
::_varphi::ᵩ
::_a::ₐ
::_e::ₑ
::_h::ₕ
::_i::ᵢ
::_j::ⱼ
::_k::ₖ
::_l::ₗ
::_m::ₘ
::_n::ₙ
::_o::ₒ
::_p::ₚ
::_r::ᵣ
::_s::ₛ
::_t::ₜ
::_u::ᵤ
::_v::ᵥ
::_x::ₓ
#Hotstring *
;#endregion

;#region [definitions] single character shortcuts: fonts

; shortened: math** -> m**

::\mbb0::𝟘
::\mbb1::𝟙
::\mbb2::𝟚
::\mbb3::𝟛
::\mbb4::𝟜
::\mbb5::𝟝
::\mbb6::𝟞
::\mbb7::𝟟
::\mbb8::𝟠
::\mbb9::𝟡

::\mbbA::𝔸
::\mbbB::𝔹
::\mbbC::ℂ
::\mbbD::𝔻
::\mbbE::𝔼
::\mbbF::𝔽
::\mbbG::𝔾
::\mbbH::ℍ
::\mbbI::𝕀
::\mbbJ::𝕁
::\mbbK::𝕂
::\mbbL::𝕃
::\mbbM::𝕄
::\mbbN::ℕ
::\mbbO::𝕆
::\mbbP::ℙ
::\mbbQ::ℚ
::\mbbR::ℝ
::\mbbS::𝕊
::\mbbT::𝕋
::\mbbU::𝕌
::\mbbV::𝕍
::\mbbW::𝕎
::\mbbX::𝕏
::\mbbY::𝕐
::\mbbZ::ℤ

::\mbba::𝕒
::\mbbb::𝕓
::\mbbc::𝕔
::\mbbd::𝕕
::\mbbe::𝕖
::\mbbf::𝕗
::\mbbg::𝕘
::\mbbh::𝕙
::\mbbi::𝕚
::\mbbj::𝕛
::\mbbk::𝕜
::\mbbl::𝕝
::\mbbm::𝕞
::\mbbn::𝕟
::\mbbo::𝕠
::\mbbp::𝕡
::\mbbq::𝕢
::\mbbr::𝕣
::\mbbs::𝕤
::\mbbt::𝕥
::\mbbu::𝕦
::\mbbv::𝕧
::\mbbw::𝕨
::\mbbx::𝕩
::\mbby::𝕪
::\mbbz::𝕫

::\mcalA::𝒜
::\mcalB::ℬ
::\mcalC::𝒞
::\mcalD::𝒟
::\mcalE::ℰ
::\mcalF::ℱ
::\mcalG::𝒢
::\mcalH::ℋ
::\mcalI::ℐ
::\mcalJ::𝒥
::\mcalK::𝒦
::\mcalL::ℒ
::\mcalM::ℳ
::\mcalN::𝒩
::\mcalO::𝒪
::\mcalP::𝒫
::\mcalQ::𝒬
::\mcalR::ℛ
::\mcalS::𝒮
::\mcalT::𝒯
::\mcalU::𝒰
::\mcalV::𝒱
::\mcalW::𝒲
::\mcalX::𝒳
::\mcalY::𝒴
::\mcalZ::𝒵

::\mcala::𝒶
::\mcalb::𝒷
::\mcalc::𝒸
::\mcald::𝒹
::\mcale::ℯ
::\mcalf::𝒻
::\mcalg::ℊ
::\mcalh::𝒽
::\mcali::𝒾
::\mcalj::𝒿
::\mcalk::𝓀
::\mcall::𝓁
::\mcalm::𝓂
::\mcaln::𝓃
::\mcalo::ℴ
::\mcalp::𝓅
::\mcalq::𝓆
::\mcalr::𝓇
::\mcals::𝓈
::\mcalt::𝓉
::\mcalu::𝓊
::\mcalv::𝓋
::\mcalw::𝓌
::\mcalx::𝓍
::\mcaly::𝓎
::\mcalz::𝓏

::\mfrakA::𝔄
::\mfrakB::𝔅
::\mfrakC::ℭ
::\mfrakD::𝔇
::\mfrakE::𝔈
::\mfrakF::𝔉
::\mfrakG::𝔊
::\mfrakH::ℌ
::\mfrakI::ℑ
::\mfrakJ::𝔍
::\mfrakK::𝔎
::\mfrakL::𝔏
::\mfrakM::𝔐
::\mfrakN::𝔑
::\mfrakO::𝔒
::\mfrakP::𝔓
::\mfrakQ::𝔔
::\mfrakR::ℜ
::\mfrakS::𝔖
::\mfrakT::𝔗
::\mfrakU::𝔘
::\mfrakV::𝔙
::\mfrakW::𝔚
::\mfrakX::𝔛
::\mfrakY::𝔜
::\mfrakZ::ℨ

::\mfraka::𝔞
::\mfrakb::𝔟
::\mfrakc::𝔠
::\mfrakd::𝔡
::\mfrake::𝔢
::\mfrakf::𝔣
::\mfrakg::𝔤
::\mfrakh::𝔥
::\mfraki::𝔦
::\mfrakj::𝔧
::\mfrakk::𝔨
::\mfrakl::𝔩
::\mfrakm::𝔪
::\mfrakn::𝔫
::\mfrako::𝔬
::\mfrakp::𝔭
::\mfrakq::𝔮
::\mfrakr::𝔯
::\mfraks::𝔰
::\mfrakt::𝔱
::\mfraku::𝔲
::\mfrakv::𝔳
::\mfrakw::𝔴
::\mfrakx::𝔵
::\mfraky::𝔶
::\mfrakz::𝔷
;#endregion

; reset
#Hotstring ?0 *0 C0