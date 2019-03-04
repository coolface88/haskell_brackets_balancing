module Main where

import Sol1
import Sol2

main :: IO ()
main = do
   putStrLn "Solution 1:"
   putStrLn "Please enter your parentheses string"
   string1 <- getLine 
   check string1
 
   putStrLn "Solution 2:"
   putStrLn "Please enter your string"
   string2 <- getLine
   print $ isBalancedE string2

         
         
