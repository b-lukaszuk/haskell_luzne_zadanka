module HuttonsRazor where

data Expr = Lit Integer | Add Expr Expr

eval :: Expr -> Integer
eval (Lit x) = x
eval (Add e1 e2) = (eval e1) + (eval e2)

-- hmm, is that it?
-- ok, some simple checks to verify that
r1 :: Integer
r1 = eval (Add (Lit 1) (Lit 9001))

r2 :: Integer
r2 = eval (Add (Add (Lit 1) (Lit 4)) (Lit 9001))

r3 :: Integer
r3 = eval (Add (Add (Lit 1) (Lit 4)) (Add (Lit 100) (Lit 200)))
-- it appears to be the end
