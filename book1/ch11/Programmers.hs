module Programmers where

data OS = GnuPlusLinux | OpenBSD | Mac | Windows deriving (Eq, Show)

data ProgLang = Haskell | Agda | Idris | PureScript deriving (Eq, Show)

data Programmer = Programmer { os :: OS , lang :: ProgLang } deriving (Eq, Show)

allOSs :: [OS]
allOSs = [ GnuPlusLinux , OpenBSD, Mac , Windows]

allProgLangs:: [ProgLang]
allProgLangs = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = [Programmer {os = opSys, lang = pLang} |
                  opSys <- allOSs, pLang <- allProgLangs]
