# Ch01


## Intermission: Equivalence Exercises

Which of the following is equivalent to the lambda term

$\lambda xy.xz$ answer: $\lambda mn.mz$

Rationale: The same formula, different letters.

<br>

$\lambda xy.xxy$ answer: $\lambda a.(\lambda b.aab)$

Rationale: Before we transformed formula $\lambda xyz.xz(yz)$ to ($\lambda
x.\lambda y.\lambda z.xz(yz)$) (a split of a function with three arguments to
three functions with one argument each). Therefore, we can reverse the proces
and transform $\lambda a.(\lambda b.aab)$ to $\lambda ab.aab$ which is equal to
$\lambda xy.xxy$ (the same formula different letters).

<br>

$\lambda xyz.zx$ answer: $\lambda tos.st$

Rationale: The same formula, different letters.

## Combinators

Examples:
- $\lambda x.xxx$ - combinator
- $\lambda xy.zx$ - not combinator (free variable z)
- $\lambda xyz.xy(zx)$ - combinator
- $\lambda xyz.xy(zxy)$ - combinator
- $\lambda xy.xy(zxy)$ - not combinator (free variable z)

## Normal form or diverge?

Examples:
- $\lambda x.xxx$ - normal
- $(\lambda z.zz)(\lambda y.yy)$ - diverge (cannot reduce)
- $(\lambda x.xxx)z$ - normal

## Beta reduce

### case 1

$(\lambda abc.cba)zz(\lambda wv.w)$<br>
$(\lambda a.\lambda b.\lambda c.cba)zz(\lambda w.\lambda v.w)$<br>
$(\lambda a.\lambda b.\lambda c.cba)(z)(z)(\lambda w.\lambda v.w)$<br>
$[a:=z]$<br>
$(\lambda b.\lambda c.cbz)(z)(\lambda w.\lambda v.w)$<br>
$[b:=z]$<br>
$(\lambda c.czz)(\lambda w.\lambda v.w)$<br>
$[c:=(\lambda w.\lambda v.w)]$<br>
$((\lambda w.\lambda v.w)zz)$<br>
$((\lambda w.\lambda v.w)(z)(z))$<br>
$[w:=z]$<br>
$((\lambda v.z)(z))$<br>
$[v:=z]$<br>
$((z))$<br>
$(z)$<br>
$z$<br>

### case 2

$(\lambda x.\lambda y.xyy)(\lambda a.a)b$<br>
$[x:=(\lambda a.a)]$<br>
$(\lambda y.(\lambda a.a)yy)b$<br>
$[y:=b]$<br>
$((\lambda a.a)bb)$<br>
$((\lambda a.a)(b)(b))$<br>
$[a:=b]$<br>
$((b)(b))$<br>
$(b)(b)$<br>
$bb$<br>

### case 3

$(\lambda y.y)(\lambda x.xx)(\lambda z.zq)$<br>
$[y:=(\lambda x.xx)]$<br>
$((\lambda x.xx)(\lambda z.zq))$<br>
$[x:=(\lambda z.zq)]$<br>
$((\lambda z.zq)(\lambda z.zq))$<br>
$[z:=(\lambda z.zq)]$<br>
$((\lambda z.zq)q)$<br>
$[z:=q]$<br>
$((qq))$<br>
$(qq)$<br>
$qq$<br>

### case 4

$(\lambda z.z)(\lambda z.zz)(\lambda z.zy)$<br>
Hint: alpha equivalence<br>
$(\lambda a.a)(\lambda b.bb)(\lambda c.cy)$<br>
$[a:=(\lambda b.bb)]$<br>
$((\lambda b.bb)(\lambda c.cy))$<br>
$[b:=(\lambda c.cy)]$<br>
$(((\lambda c.cy)(\lambda c.cy)))$<br>
$[c:=(\lambda c.cy)]$<br>
$((((\lambda c.cy)y)))$<br>
$[c:=y]$<br>
$((((yy))))$<br>
$(((yy)))$<br>
$((yy))$<br>
$(yy)$<br>
$yy$<br>

### case 5

$(\lambda x.\lambda y.xyy)(\lambda y.y)y$<br>
-- Here I will also use alpha equivalence<br>
$(\lambda x.\lambda y.xyy)(\lambda a.a)b$<br>
$[x:=(\lambda a.a)]$<br>
$(\lambda y.(\lambda a.a)yy)b$<br>
$[y:=b]$<br>
$((\lambda a.a)bb)$<br>
$((\lambda a.a)(b)(b))$<br>
$[a:=b]$<br>
$((b)(b))$<br>
$(b)(b)$<br>
$bb$<br>

### case 6

$(\lambda a.aa)(\lambda b.ba)c$<br>
-- Here I will also use alpha equivalence<br>
$(\lambda a.aa)(\lambda b.bd)c$<br>
$[a:=(\lambda b.bd)]$<br>
$((\lambda b.bd)(\lambda b.bd))c$<br>
$[b:=(\lambda b.bd)]$<br>
$(((\lambda b.bd)d))c$<br>
$[b:=d]$<br>
$(((dd)))c$<br>
$((dd))c$<br>
$(dd)c$<br>
$ddc$<br>

### case 7

$(\lambda xyz.xz(yz))(\lambda x.z)(\lambda x.a)$<br>
-- Here I will also use alpha equivalence<br>
$(\lambda xyz.xz(yz))(\lambda b.c)(\lambda d.e)$<br>
$(\lambda x.\lambda y.\lambda z.xz(yz))(\lambda b.c)(\lambda d.e)$<br>
$[x:=(\lambda b.c)]$<br>
$(\lambda y.\lambda z.(\lambda b.c)z(yz))(\lambda d.e)$<br>
$[y:=(\lambda d.e)]$<br>
$(\lambda z.(\lambda b.c)z((\lambda d.e)z))$<br>
$(\lambda z.(\lambda b.c)(z)((\lambda d.e)z))$<br>
$[b:=z]$<br>
$(\lambda z.(c)((\lambda d.e)z))$<br>
$(\lambda z.(c)((\lambda d.e)(z)))$<br>
$[d:=z]$<br>
$(\lambda z.(c)((e)))$<br>
$(\lambda z.(c)(e))$<br>
$(\lambda z.ce)$<br>
