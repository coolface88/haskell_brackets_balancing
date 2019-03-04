module Sol2
    (
     isBalancedE
    ) where

import Control.Monad
import Text.Printf
import Data.List
  

matches x y = (x == '(' && y == ')') ||
              (x == '{' && y == '}') ||
              (x == '[' && y == ']')

isOpen  x = x == '(' || x == '{' || x == '['

isClose x = x == ')' || x == '}' || x == ']'

isBracketsOpen x y = x == '[' && y == '['

isBracesOpen x y = x == '{' && y == '{'

isBracketsClose x y = x == ']' && y == ']'

isBracesClose x y = x == '}' && y == '}'

isSequence x y = x /= y || x == '(' || y == '(' 

isCloseSeq x y = x /= y || x == ')' || y == ')'

-- Inputs:  (x:xs) user input string
--          (y:ys) the stack like implementation for the string balance checking
--          b,c state of current enclosing type
--          ((v1,v2),lls) list of states to represent types of corresponding open characters
--          d is there any substring left
--          e is the substring actually enclosed
-- Outputs: (z:zs) new string replacement for enclosed substrings 
--          (m:ms) new string of not enclosing

isBalan [] [] (z:zs) (m:ms) _ _ [] _ e 
                  | e == False                                              = (m:ms)
                  | e == True                                               = (z:zs)
isBalan [] _  _      _      _ _ _  _ _                                      = "The substring was imbalanced"
isBalan (x:xs) []  []  []   _ _  []  _ _ 
                  | isOpen x                                                = isBalan (x:xs) [] [x] [x] False False [] False False
                  | isClose x                                               = "There was an unmatched close within the substring"
                  | otherwise                                               = "The substring was imbalanced"
isBalan [x] [] (z:zs) (m:ms) _ _ [] d e 
                  | isOpen x && d == False                                  = isBalan [] [x] (z:zs) (m:ms) False False [(False,False)] False False
                  | isClose x                                               = "There was an unmatched close within the substring"
                  | otherwise                                               = "The substring was imbalanced"

isBalan (x:w:xs) [] (z:zs) (m:ms) _ _  [] d e     
                  | isOpen x && isSequence x w && d == False                = isBalan (w:xs) [x] (z:zs) (m:ms) False False [(False,False)] False False
                  | isOpen x && isSequence x w && d == True && e == False   = isBalan (w:xs) [x] ((z:zs) ++ [x]) ((z:zs) ++ [x]) False False [(False,False)] False False
                  | isOpen x && isSequence x w && d == True && e == True    = isBalan (w:xs) [x] ((z:zs) ++ [x]) ((z:zs) ++ [x]) False False [(False,False)] False False
                  | isBracketsOpen x w && d == False                        = isBalan (w:xs) [x] ['{'] (m:ms) True False [(True,False)] False True
                  | isBracketsOpen x w && d == True && e == False           = isBalan (w:xs) [x] ((z:zs) ++ ['{']) ((z:zs) ++ [x]) True False [(True,False)] False True
                  | isBracketsOpen x w && d == True && e == True            = isBalan (w:xs) [x] ((z:zs) ++ ['{']) ((z:zs) ++ [x]) True False [(True,False)] False True
                  | isBracesOpen x w && d == False                          = isBalan (w:xs) [x] ['('] (m:ms) False True [(False,True)] False True
                  | isBracesOpen x w && d == True && e == False             = isBalan (w:xs) [x] ((z:zs) ++ ['(']) ((z:zs) ++ [x]) False True [(False,True)] False True
                  | isBracesOpen x w && d == True && e == True              = isBalan (w:xs) [x] ((z:zs) ++ ['(']) ((z:zs) ++ [x]) False True [(False,True)] False True
                  | isClose x                                               = "There was an unmatched close within the substring"
                  | otherwise                                               = "The substring was imbalanced"
isBalan (x:w:xs) [h,y] (z:zs) (m:ms) b c ((v1,v2):lls) _ e
                  | isOpen x && b == False && c == False                    = isBalan (w:xs) (x:[h,y]) ((z:zs) ++ [x]) ((m:ms) ++ [x])  False False ((False,False):((v1,v2):lls)) False False
                  | isOpen x && b == True && c == False                     = isBalan (w:xs) (x:[h,y]) ((z:zs) ++ ['{']) ((m:ms) ++ [x]) True False ((True,False):((v1,v2):lls)) False  True
                  | isOpen x && b == False && c == True                     = isBalan (w:xs) (x:[h,y]) ((z:zs) ++ ['(']) ((m:ms) ++ [x]) False True ((False,True):((v1,v2):lls)) False True
                  | isBracketsClose x w && b == True && c == False          = isBalan (xs) [] ((z:zs) ++ ['}','}']) ((m:ms) ++ [x,w]) False True (tail lls) True (True && e)
                  | isBracesClose x w && b == False && c == True            = isBalan (xs) [] ((z:zs) ++ [')',')']) ((m:ms) ++ [x,w]) False True (tail lls) True (True && e)
                  | isCloseSeq x w && matches h x && matches y w            = isBalan (xs) [] ((m:ms) ++ [x,w]) ((m:ms) ++ [x,w]) False False (tail lls) True (False && e)
                  | isClose x && matches h x && v1 == False && v2 == False  = isBalan (w:xs) [y] ((z:zs) ++ [x]) ((m:ms) ++ [x]) False False lls True False
                  | isClose x && matches h x && v1 == True  && v2 == False  = isBalan (w:xs) [y] ((z:zs) ++ ['}']) ((m:ms) ++ [x]) True False lls True True
                  | isClose x && matches h x && v1 == False && v2 == True   = isBalan (w:xs) [y] ((z:zs) ++ [')']) ((m:ms) ++ [x])  False True lls True True
                  | otherwise                                               = "The substring was imbalanced"
isBalan (x:xs) (y:ys) (z:zs) (m:ms) b c  ((v1,v2):lls) _ e 
                  | isOpen x && b == False && c == False                    = isBalan (xs) (x:y:ys) ((z:zs) ++ [x]) ((m:ms) ++ [x])  False False ((False,False):((v1,v2):lls)) False False
                  | isOpen x && b == True  && c == False                    = isBalan (xs) (x:y:ys) ((z:zs) ++ ['{']) ((m:ms) ++ [x]) True False ((True,False):((v1,v2):lls)) False  True
                  | isOpen x && b == False && c == True                     = isBalan (xs) (x:y:ys) ((z:zs) ++ ['(']) ((m:ms) ++ [x]) False True ((False,True):((v1,v2):lls)) False True
                  | isClose x && matches y x && v1 == False && v2 == False  = isBalan (xs) ys ((z:zs) ++ [x])   ((m:ms) ++ [x]) False False lls True False
                  | isClose x && matches y x && v1 == True  && v2 == False  = isBalan (xs) ys ((z:zs) ++ ['}']) ((m:ms) ++ [x]) True  False lls True True
                  | isClose x && matches y x && v1 == False && v2 == True   = isBalan (xs) ys ((z:zs) ++ [')']) ((m:ms) ++ [x]) False True  lls True True 
                  | otherwise                                               = "The substring was imbalanced"

isBalancedE string = isBalan string [] [] [] False False [] False False



