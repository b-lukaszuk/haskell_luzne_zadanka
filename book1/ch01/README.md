# Ch01


## Intermission: Equivalence Exercises

Which of the following is equivalent to the lsted lambda term

`\xy.xz == \mn.mz`
rationale: the same formula, different letters
<br><br>
`\xy.xxy == \a.(\b.aab)`
rationale: before we transformed formula `\xyz.xz(yz) to (\x.\y.\z.xz(yz))` (a split of a function with three arguments to three functions with one argument each) so we can reverse the proces and transform `\a.(\b.aab) to \ab.aab` which is equal to `\xy.xxy` (the same formula different letters)
<br><br>
`\xyz.zx == \tos.st`
rationale: the same formula, different letters

## Combinators

`\x.xxx` - combinator
`\xy.zx` - not combinator (free variable z)
`\xyz.xy(zx)` - combinator
`\xyz.xy(zxy)` - combinator
`\xy.xy(zxy)` - not combinator (free variable z)

## Normal form or diverge?

`\x.xxx` - normal
`(\z.zz)(\y.yy)` - diverge (cannot reduce)
`(\x.xxx)z` - normal

## Beta reduce

### case 1

`(\abc.cba)zz(\wv.w)`
(\a.\b.\c.cba)zz(\w.\v.w)
(\a.\b.\c.cba)(z)(z)(\w.\v.w)
[a:=z]
(\b.\c.cbz)(z)(\w.\v.w)
[b:=z]
(\c.czz)(\w.\v.w)
[c:=(\w.\v.w)]
((\w.\v.w)zz)
((\w.\v.w)(z)(z))
[w:=z]
((\v.z)(z))
[v:=z]
((z))
(z)
z

### case 2

`(\x.\y.xyy)(\a.a)b`
[x:=(\a.a)]
(\y.(\a.a)yy)b
[y:=b]
((\a.a)bb)
((\a.a)(b)(b))
[a:=b]
((b)(b))
(b)(b)
bb
