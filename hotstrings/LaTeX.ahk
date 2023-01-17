/**
 * shortcuts for some LaTeX keys
 */

; within other text | no end char needed | case sensitive
#Hotstring ? * C
; allow to activate other #InputLevel
#InputLevel 1

::\!``::¡
::\?``::¿

::\AE::Æ
::\Alpha::Α
::\Beta::Β
::\Box::□
::\Bumpeq::≎
::\Cap::⋒
::\Chi::Χ
::\Cup::⋓
::\DH::Ð
::\Delta::Δ
::\Diamond::◇
::\Downarrow::⇓
::\Epsilon::Ε
::\Eta::Η
::\Finv::Ⅎ
::\Gamma::Γ
::\Im::ℑ
::\Join::⋈
::\Kappa::Κ
:X:\L:: SendEvent("Ł")
::Łambda::Λ
::Łeftarrow::⇐
::Łeftrightarrow::⇔
::Łleftarrow::⇚
::Łongleftarrow::⇐
::Łongleftrightarrow::⇔
::Łongrightarrow::⇒
::Łsh::↰
::\Mu::Μ
::\Nu::Ν
:X:\O:: SendEvent("Ø")
::ØE::Œ
::Ømega::Ω
::Ømicron::Ο
:X:\P:: SendEvent("¶")
::¶hi::Φ
::¶i::Π
::¶si::Ψ
::\Re::ℜ
::\Rho::Ρ
::\Rightarrow::⇒
::\Rrightarrow::⇛
::\Rsh::↱
:X:\S:: SendEvent("§")
::§igma::Σ
::§ubset::⋐
::§upset::⋑
::\TH::Þ
::\Tau::Τ
::\Theta::Θ
::\Uparrow::⇑
::\Updownarrow::⇕
::\Upsilon::Υ
::\Vdash::⊩
::\Vvdash::⊪
::\Xi::Ξ
::\Zeta::Ζ

::\ae::æ
::\aleph::ℵ
::\alpha::α
::\angle::∠
:X:\approx:: SendEvent("≈")
::≈eq::≊
::\aquarius::♒
::\aries::♈
::\ascnode::☊
:X:\ast:: SendEvent("∗")
::∗rosun::☉
::\asymp::≍

::a̱ckepsilon::∍
::a̱ckprime::‵
::a̱cksim::∽
::a̱rwedge::⊼
::e̱cause::∵
::e̱ta::β
::e̱th::ℶ
::e̱tween::≬
::i̱gcap::⋂
::i̱gcirc::○
::i̱gcup::⋃
::i̱godot::⊙
::i̱goplus::⊕
::i̱gotimes::⊗
::i̱gsqcup::⊔
::i̱gstar::★
::i̱gtriangledown::▽
::i̱gtriangleup::△
::i̱guplus::⊎
::i̱gvee::⋁
::i̱gwedge::⋀
::ḻackbishop::♝
::ḻackking::♚
::ḻackknight::♞
::ḻacklozenge::◆
::ḻackpawn::♟
::ḻackqueen::♛
::ḻackrook::♜
::ḻacksquare::■
::ḻacktriangle::▲
::ḻacktriangledown::▼
::ḻacktriangleleft::◀
::ḻacktriangleright::▷
::o̱t::⊥
::o̱wtie::⋈
::o̱xdot::⊡
::o̱xminus::⊟
::o̱xplus::⊞
::o̱xtimes::⊠
::u̱llet::∙
::u̱mpeq::≏

::a̧ncer::♋
:X:a̧p:: SendEvent("∩")
::∩ricornus::♑
::∩slockkey::⇪
:X:ḑot:: SendEvent("⋅")
::⋅s::⋯
::ȩnterdot::⋅
::ȩnts::¢
::ḩi::χ
:X:i̧rc:: SendEvent("∘")
::∘eq::≗
::∘learrowleft::↺
::∘learrowright::↻
::∘ledS::Ⓢ
::∘ledast::⊛
::∘ledcirc::⊚
::∘leddash::⊝
::ļubsuit::♣
::m̧dkey::⌘
::o̧mplement::∁
::o̧ng::≅
::o̧njunction::☌
::o̧prod::∐
::o̧pyright::©
::u̧p::∪
::u̧rlyeqprec::⋞
::u̧rlyeqsucc::⋟
::u̧rlyvee::⋎
::u̧rlywedge::⋏
::u̧rvearrowleft::↶
::u̧rvearrowright::↷

::ạg::†
::ạleth::ℸ
::ạshleftarrow::⇠
::ạshrightarrow::⇢
::ạshv::⊣
::ḍag::‡
::ḍots::⋱
::ẹlkey::⌫
::ẹlta::δ
::ẹscnode::☋
; override ::\dh::
#InputLevel 0
::ḥ::ð
#InputLevel 1
:X:ịamond:: SendEvent("⋄")
::⋄suit::♢
::ịgamma::Ϝ
:X:ịv:: SendEvent("÷")
::÷ideontimes::⋇
:X:ọteq:: SendEvent("≐")
::≐dot::≑
::ọtplus::∔
::ọwnarrow::↓
::ọwndownarrows::⇊
::ọwnharpoonleft::⇃
::ọwnharpoonright::⇂

::\earth::⊕
::\ejectkey::⏏
::\ell::ℓ
::\emptyset::∅
::\enterkey::⌤
::\epsdice1::⚀
::\epsdice2::⚁
::\epsdice3::⚂
::\epsdice4::⚃
::\epsdice5::⚄
::\epsdice6::⚅
::\epsilon::∊
::\eqcirc::≖
::\equiv::≡
::\esckey::⎋
::\eta::η
::\eth::ð
::\euro::€
::\exists::∃

::\fallingdotseq::≒
::\flat::♭
::\forall::∀
::\frown::⌢

::\gamma::γ
:X:\ge:: SendEvent("≥")
::≥mini::♊
::≥q::≧
:X:\gg:: SendEvent("≫")
::≫g::⋙
::\gimel::ℷ
::\gtrdot::⋗
::\gtreqless::⋛
::\gtrless::≷
::\gtrsim::≳

::\hbar::ℏ
::\heartsuit::♡
::\hookleftarrow::↩
::\hookrightarrow::↪
::\hslash::ℏ

::\iiiint::⨌
::\iiint::∭
::\iint::∬
::\implies::⇒
:X:\in:: SendEvent("∈")
::∈fty::∞
:X:∈t:: SendEvent("∫")
::∫ercal::⊺
::\iota::ι

::\jupiter::♃

::ąppa::κ

:X:\l:: SendEvent("ł")
::łambda::λ
::łangle::⟨
::łceil::⌈
::łdots::…
:X:łe:: SendEvent("≤")
::≤adsto::↝
:X:≤ftarrow:: SendEvent("←")
::←tail::↢
::≤ftharpoondown::↽
::≤ftharpoonup::↼
::←s::⇇
::≤ftmoon::☾
:X:≤ftrightarrow:: SendEvent("↔")
::↔s::⇆
::≤ftrightharpoons::⇋
::≤ftrightsquigarrow::↭
::≤ftthreetimes::⋋
::≤o::♌
::≤q::≦
::≤ssdot::⋖
::≤sseqgtr::⋚
::≤ssgtr::≶
::≤sssim::≲
::łfloor::⌊
::łhd::⊲
::łibra::♎
:X:łl:: SendEvent("≪")
::≪l::⋘
::łongleftarrow::←
::łongleftrightarrow::↔
::łongmapsto::⇖
::łongrightarrow::→
::łooparrowleft::↫
::łooparrowright::↬
::łozenge::◊
::łtimes::⋉

::\mapsto::↦
::\mars::♂
::\mbox'::’
::’'::”
::\measuredangle::∡
::\mercury::☿
::\mho::℧
::\mid::∣
::\models::⊨
::\mp::∓
:X:\mu:: SendEvent("μ")
::μltimap::⊸

::\nabla::∇
::\natural::♮
::\nearrow::↗
::\neg::¬
::\neptune::♆
::\neq::≠
::\nexists::∄
::\ng::ŋ
::\ni::∋
::\not<::≮
::\not>::≯
::\notVdash::⊮
::\notapprox::≉
::\notcong::≇
::\notequiv::≢
::\notge::≱
::\notgtrless::≹
::\notin::∉
::\notle::≰
::\notmodels::⊭
::\notni::∌
::\notsim::≄
::\notsqsubseteq::⋢
::\notsqsupseteq::⋣
:X:\notsubset:: ("⊄")
::⊄eq::⊈
::\notsupset::⊅
:X:⊅eq:: ("⊉")
::\notvdash::⊬
::\notin::∉
::\nu::ν
::\nwarrow::↖

:X:\o:: SendEvent("ø")
::ødot::⊙
::øe::œ
::øint::∮
::ømega::ω
::ømicron::ο
::øminus::⊖
::øplus::⊕
::øpposition::☍
::øptkey::⌥
::øslash::⊘
::øtimes::⊗

::\parallel::∥
::\partial::∂
::\perp::⊥
::\phi::φ
:X:\pi:: SendEvent("π")
::πlcrow::¶
::πsces::♓
::πtchfork::⋔
::\pluto::♇
::\pm::±
::\pound::£
:X:\prec:: SendEvent("≺")
::≺curlyeq::≼
::≺eq::≼
::≺sim::≾
::\prime::′
::\prod::∏
::\propto::∝
::\psi::ψ

::ångle::⟩
::c̊eil::⌉
::e̊gistered::®
::e̊turnkey::⏎
::e̊vtabkey::⇤
::f̊loor::⌋
::h̊d::⊳
::h̊o::ρ
:X:i̊ghtarrow:: SendEvent("→")
::→tail::↣
::i̊ghtdelkey::⌦
::i̊ghtharpoondown::⇁
::i̊ghtharpoonup::⇀
::i̊ghtleftarrows::⇄
::i̊ghtleftharpoons::⇌
::i̊ghtmoon::☽
::i̊ghtrightarrows::⇉
::i̊ghtsquigarrow::⇝
::i̊ghtthreetimes::⋌
::i̊singdotseq::≓
::t̊imes::⋊

::\sagittarius::♐
::\saturn::♄
::\scorpio::♏
::\searrow::↘
::\section::§
::\setminus::∖
::\sharp::♯
::\shiftkey::⇧
::\shortparallel::∥
::\sigma::σ
:X:\sim:: SendEvent("∼")
::∼eq::≃
::\smallfrown::⌢
::\smallsetminus::∖
::\smallsmile::⌣
::\smile::⌣
::\space::␣
::\spadesuit::♠
::\sphericalangle::∢
::\sqcap::⊓
::\sqcup::⊔
:X:\sqsubset:: SendEvent("⊏")
::⊏eq::⊑
:X:\sqsupset:: SendEvent("⊐")
::⊐eq::⊒
::\square::□
::\ss::ß
::\star::⋆
:X:\subset:: SendEvent("⊂")
::⊂eq::⊆
::⊂neq::⊊
:X:\succ:: SendEvent("≻")
::≻curlyeq::≽
::≻eq::≽
::≻sim::≿
::\sum::∑
:X:\supset:: SendEvent("⊃")
::⊃eq::⊇
::⊃neq::⊋
::\surd::√
::\swarrow::↙

::a̰bkey::⇥
:X:a̰u:: SendEvent("τ")
::τrus::♉
::ḛxtbabygamma::ɤ
::ḛxtbarglotstop::ʡ
::ḛxtbari::ɨ
::ḛxtbaro::ɵ
::ḛxtbarrevglotstop::ʢ
::ḛxtbaru::ʉ
::ḛxtbeltl::ɬ
::ḛxtbeta::β
::ḛxtbullseye::ʘ
::ḛxtchi::χ
::ḛxtcloserevepsilon::ɞ
::ḛxtcrh::ħ
::ḛxtctc::ɕ
::ḛxtctj::ʝ
::ḛxtctz::ʑ
::ḛxtdoublepipe::ǁ
::ḛxtdyoghlig::ʤ
::ḛxtepsilon::ɛ
::ḛxtesh::ʃ
::ḛxtfishhookr::ɾ
::ḛxtgamma::ɣ
::ḛxtglotstop::ʔ
::ḛxtgrgamma::γ
::ḛxthtb::ɓ
::ḛxthtd::ɗ
::ḛxthtg::ɠ
::ḛxthth::ɦ
::ḛxththeng::ɧ
::ḛxthtscg::ʛ
::ḛxtinvscr::ʁ
::ḛxtiota::ι
::ḛxtltailm::ɱ
::ḛxtltailn::ɲ
::ḛxtltilde::ɫ
::ḛxtlyoghlig::ɮ
::ḛxtopeno::ɔ
::ḛxtphi::ɸ
::ḛxtpipe::ǀ
::ḛxtregistered::®
::ḛxtreve::ɘ
::ḛxtrevepsilon::ɜ
::ḛxtrevglotstop::ʕ
::ḛxtrhookrevepsilon::ɝ
::ḛxtrighthookschwa::ɚ
::ḛxtrtaild::ɖ
::ḛxtrtaill::ɭ
::ḛxtrtailn::ɳ
::ḛxtrtailr::ɽ
::ḛxtrtails::ʂ
::ḛxtrtailt::ʈ
::ḛxtrtailz::ʐ
::ḛxtscb::ʙ
::ḛxtscg::ɢ
:X:ḛxtsch:: SendEvent("ʜ")
::ʜwa::ə
::ḛxtsci::ɪ
::ḛxtscl::ʟ
::ḛxtscn::ɴ
::ḛxtscoelig::ɶ
::ḛxtscr::ʀ
::ḛxtscripta::ɑ
::ḛxtscriptv::ʋ
::ḛxtscy::ʏ
::ḛxtteshlig::ʧ
::ḛxttheta::θ
::ḛxttrademark::™
::ḛxtturna::ɐ
::ḛxtturnh::ɥ
::ḛxtturnlonglegr::ɺ
::ḛxtturnm::ɯ
::ḛxtturnmrleg::ɰ
:X:ḛxtturnr:: SendEvent("ɹ")
::ɹrtail::ɻ
::ḛxtturnscripta::ɒ
::ḛxtturnv::ʌ
::ḛxtturnw::ʍ
::ḛxtturny::ʎ
::ḛxtupsilon::ʊ
::ḛxtyogh::ʒ
#InputLevel 0
:X:h̰:: SendEvent("þ")
#InputLevel 1
::þerefore::∴
::þeta::θ
::þickapprox::≈
::þicksim::∼
::ḭmes::×
::o̰p::⊤
::r̰ademark::™
:X:r̰iangle:: SendEvent("△")
::△down::▽
::△left::◁
::△lefteq::⊴
::△q::≜
::△right::▷
::△righteq::⊵
::w̰oheadleftarrow::↞
::w̰oheadrightarrow::↠

::n̆lhd::⊴
::n̆rhd::⊵
::p̆arrow::↑
::p̆downarrow::↕
::p̆harpoonleft::↿
::p̆harpoonright::↾
::p̆lus::⊎
::p̆silon::υ
::p̆uparrows::⇈
::r̆anus::⛢

::Ďash::⊨
::ǎrepsilon::ε
::ǎrkappa::ϰ
::ǎrnothing::∅
::ǎrphi::ϕ
::ǎrpi::ϖ
::ǎrpropto::∝
::ǎrrho::ϱ
::ǎrsigma::ς
::ǎrtheta::ϑ
::ǎrtriangleleft::⊲
::ǎrtriangleright::⊳
::ďash::⊢
::ďots::⋮
:X:ěe:: SendEvent("∨")
::∨bar::⊻
::ěnus::♀
::ǐrgo::♍

::\wedge::∧
::\whitebishop::♗
::\whiteking::♔
::\whiteknight::♘
::\whitepawn::♙
::\whitequeen::♕
::\whiterook::♖
::\wp::℘
::\wr::≀

::\xi::ξ

::\zeta::ζ

; reset to defaults
#Hotstring ?0 *0 C0
#InputLevel 0