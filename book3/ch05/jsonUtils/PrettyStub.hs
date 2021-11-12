module PrettyStub where

import SimpleJSON

data Doc = ToBeDefined
         deriving (Show)

-- equivalent for (++) for strings
(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

-- analogue of concat for lists
hcat :: [Doc] -> Doc
hcat xs = undefined

string :: String -> Doc
string str = undefined

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined
