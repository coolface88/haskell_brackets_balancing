module Sol1
    ( 
     check
    ) where

import Control.Monad
import Text.Printf
import Data.List
 
-- Return whether a string contains balanced brackets.  Nothing indicates a
-- balanced string, while (Just i) means an imbalance was found at, or just
-- after, the i'th bracket.  We assume the string contains only brackets.
isBalanced :: String -> Maybe Int
isBalanced = bal (-1) 0
    where bal :: Int -> Int -> String -> Maybe Int
          bal    _   0      []  = Nothing
          bal    i   _      []  = Just i
          bal    i (-1)      _  = Just i
          bal    i   n ('(':bs) = bal (i+1) (n+1) bs
          bal    i   n (')':bs) = bal (i+1) (n-1) bs
 

-- Print a string, indicating whether it contains balanced brackets.  If not,
-- indicate the bracket at which the imbalance was found.
check :: String -> IO ()
check s = maybe (balanced s) (imbalanced s) (isBalanced s)
    where balanced s     = printf "Balanced \"%s\"\n" s
          imbalanced s n = printf "Imbalanced \"%s\"\n%*s^\n" s (n+12) " "


