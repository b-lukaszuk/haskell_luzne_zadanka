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

`\x.xxx` - combinator<br>
`\xy.zx` - not combinator (free variable z)<br>
`\xyz.xy(zx)` - combinator<br>
`\xyz.xy(zxy)` - combinator<br>
`\xy.xy(zxy)` - not combinator (free variable z)<br>

## Normal form or diverge?

`\x.xxx` - normal<br>
`(\z.zz)(\y.yy)` - diverge (cannot reduce)<br>
`(\x.xxx)z` - normal<br>

## Beta reduce

### case 1

`(\abc.cba)zz(\wv.w)`<br>
(\a.\b.\c.cba)zz(\w.\v.w)<br>
(\a.\b.\c.cba)(z)(z)(\w.\v.w)<br>
[a:=z]<br>
(\b.\c.cbz)(z)(\w.\v.w)<br>
[b:=z]<br>
(\c.czz)(\w.\v.w)<br>
[c:=(\w.\v.w)]<br>
((\w.\v.w)zz)<br>
((\w.\v.w)(z)(z))<br>
[w:=z]<br>
((\v.z)(z))<br>
[v:=z]<br>
((z))<br>
(z)<br>
z<br>

### case 2

`(\x.\y.xyy)(\a.a)b`<br>
[x:=(\a.a)]<br>
(\y.(\a.a)yy)b<br>
[y:=b]<br>
((\a.a)bb)<br>
((\a.a)(b)(b))<br>
[a:=b]<br>
((b)(b))<br>
(b)(b)<br>
bb<br>

### case 3

`(\y.y)(\x.xx)(\z.zq)`<br>
[y:=(\x.xx)]<br>
((\x.xx)(\z.zq))<br>
[x:=(\z.zq)]<br>
((\z.zq)(\z.zq))<br>
[z:=(\z.zq)]<br>
((\z.zq)q)<br>
[z:=q]<br>
((qq))<br>
(qq)<br>
qq<br>

### case 4

`(\z.z)(\z.zz)(\z.zy)`<br>
Hint: alpha equivalence<br>
(\a.a)(\b.bb)(\c.cy)<br>
[a:=(\b.bb)]<br>
((\b.bb)(\c.cy))<br>
[b:=(\c.cy)]<br>
(((\c.cy)(\c.cy)))<br>
[c:=(\c.cy)]<br>
((((\c.cy)y)))<br>
[c:=y]<br>
((((yy))))<br>
(((yy)))<br>
((yy))<br>
(yy)<br>
yy<br>

### case 5

`(\x.\y.xyy)(\y.y)y`<br>
-- Here I will also use alpha equivalence<br>
(\x.\y.xyy)(\a.a)b<br>
[x:=(\a.a)]<br>
(\y.(\a.a)yy)b<br>
[y:=b]<br>
((\a.a)bb)<br>
((\a.a)(b)(b))<br>
[a:=b]<br>
((b)(b))<br>
(b)(b)<br>
bb<br>

### case 6

`(\a.aa)(\b.ba)c`<br>
-- Here I will also use alpha equivalence<br>
(\a.aa)(\b.bd)c<br>
[a:=(\b.bd)]<br>
((\b.bd)(\b.bd))c<br>
[b:=(\b.bd)]<br>
(((\b.bd)d))c<br>
[b:=d]<br>
(((dd)))c<br>
((dd))c<br>
(dd)c<br>
ddc<br>

### case 7

`(\xyz.xz(yz))(\x.z)(\x.a)`<br>
-- Here I will also use alpha equivalence<br>
(\xyz.xz(yz))(\b.c)(\d.e)<br>
(\x.\y.\z.xz(yz))(\b.c)(\d.e)<br>
[x:=(\b.c)]<br>
(\y.\z.(\b.c)z(yz))(\d.e)<br>
[y:=(\d.e)]<br>
(\z.(\b.c)z((\d.e)z))<br>
(\z.(\b.c)(z)((\d.e)z))<br>
[b:=z]<br>
(\z.(c)((\d.e)z))<br>
(\z.(c)((\d.e)(z)))<br>
[d:=z]<br>
(\z.(c)((e)))<br>
(\z.(c)(e))<br>
(\z.ce)<br>
