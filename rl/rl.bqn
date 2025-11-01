#!/usr/bin/env bqn
# TODO use 
e←@+27                                                    
ToBase64 ← {                                              
  b64 ← ∾ (⊣+↕∘¬˜)¨˝˘ ∘‿2⥊"AZaz09++//"                    
  K64 ← ⥊¨⟜(4⋆⟨1+↕3,2-↕3⟩)                                # Bytes split as 6/2-4/4-2/6
  l←≠i←𝕩-@                                                
  "Base64 input must consist of bytes (<@+256)" ! ∧´256>i 
  f←l⥊1+0=↕3 ⋄ M←((+´f)⥊0<↕4) × f⊸/ ⋄ a‿b←K64 l           
  v←a (⌊∘÷˜ «⊸+○M b×|) i                                  
  (v⊏b64)∾(3|-l)⥊'='                                      
}                                                         

s←500
x←" "
v←0
z←0
•term.OutRaw e∾"[2J"                                       # top
•term.RawMode 1                                           
Ex←{𝕊:
  c←•term.CharN @
  {x↩⋈𝕩}⍟(≠⟜0) c
  z↩255|z+10
  v↩255⌊{"a":v+10;0}x
  d←ToBase64 @+∾255‿v‿z¨↕s×s                           
  •term.OutRaw e∾"[H"                                       # top
  •term.OutRaw e∾"_Ga=T,f=24,s=s,v=s;" ∾ d ∾e           # print image
  •term.Flush@                                              
  •Delay 0.05
}
1˙∘Ex •_while_ ⊢ 1 
