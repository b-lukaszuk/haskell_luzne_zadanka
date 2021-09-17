# Ch15

Choosen exercises (some were too easy, or not enough interesting) from Chapter 15 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Optional Monoid](#optional-monoid)

---

## Optional Monoid

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `optionalMonoid/`

Write the `Monoid` instance for our `Maybe` type renamed to `Optional`

<pre>
data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
mempty = undefined
mappend = undefined
</pre>

Expected output:

<pre>
Prelude> Only (Sum 1) `mappend` Only (Sum 1)
Only (Sum {getSum = 2})

Prelude> Only (Product 4) `mappend` Only (Product 2)
Only (Product {getProduct = 8})

Prelude> Only (Sum 1) `mappend` Nada
Only (Sum {getSum = 1})

Prelude> Only [1] `mappend` Nada
Only [1]

Prelude> Nada `mappend` Only (Sum 1)
Only (Sum {getSum = 1})
</pre>
