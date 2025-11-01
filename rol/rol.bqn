#!/usr/bin/env bqn
e←@+27                                                    
x←0
•term.RawMode 1                                           
Ex←{𝕊:
  c←•term.CharN @
  {x↩⋈𝕩}⍟(≠⟜0) c
  •term.OutRaw e∾"[2J"                                     
  •term.OutRaw e∾"[H"                                   


  •term.Flush@                                              
  •Delay 0.05
}
1˙∘Ex •_while_ ⊢ 1 
