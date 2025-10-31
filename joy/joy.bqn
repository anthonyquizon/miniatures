

# eg 3 2↕¨ → 3¨↕2




nil‿num‿prim←↕≠tk←⟨             # Type and precedence. Operators are eval right to left, 
"", ↕9, ⊑¨•primitives           # rules and equalities cannot be nested
⟩

Eval←{𝕊c:
  c /˜⟜(¬∘∊⟜⟨' ',@+10⟩)↩        # remove whitespace
  d←(¬c∊"[]")/»+`('['⊸=-=⟜']')c # depth vector with offset of bracket and operator
  c (¬c∊"[]")⊸/↩                # remove brackets for other vectors
  t←c
  #d←+`('['⊸=-=⟜']')c
  # TODO find quote
  •Show [d,c]
  # remove whitespace
}

{∨´⟨"test"⟩⍷𝕩?
  Eval "[1 2 3] 1 +⍉"
;@} •args

