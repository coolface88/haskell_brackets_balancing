# Problem 1
Parentheses are considered balanced when they designate nested subexpressions. 
For example:
`( ) ( ( ) )`

and 

`( ( ) )`

are balanced while 

`) (` 

and 

`( ) ( ( )`

are not.

Parse a given string to a data structure and write a function that evaluates it to determine if the string contains balanced parentheses.

# Problem 2
There are more characters than just parentheses that obey balanced syntax:  `[]`  and `{}` are two sets. Taking a string of comprised only of characters from `( ) [ ] { }` (no whitespace), write a function that computes the following reduction:  

        - If a substring is balanced and enclosed by a pair of brackets, `[ [ ] ]`, replace the brackets and substring by `{}`
        
        - If a substring is balanced and enclosed by a pair of braces, `{ { } }`, replace the braces and substring by `( )`
        
        - If possible, do the above in a single traversal of the data-structure.

# Build and exec
stack build

stack exec balanced-parenthesis-exe


Ex output: 

Solution 1:

Please enter your parentheses string

()()

Balanced "()()"

Solution 2:

Please enter your string

()()((()()))[][](((())())()){{{}{}}}{[]{[]{[]}}}()(){{{}{}{}}}{{{[]}[]}[]}()(){}[][]{{}}[[]]

"()()((()()))[][](((())())())((()())){[]{[]{[]}}}()()((()()())){{{[]}[]}[]}()(){}[][](()){{}}"
