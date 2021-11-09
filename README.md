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


# Solution overview

1) Implement a pushdown automata using stack data structure.
 - On encountering an open braces, open bracket or open square bracket push them on the stack
 - On encountering a closing corresponding ones  pop them off the stack 
 - If attempt to pop an empty stack, reject 
 - If stack not empty at the end, reject
 - Else accept

2) I will model the solution with a finite state machine
 - Define a state set regarding the contract terms and conditions
 - The FSM associates with a monoidal structure, I would consider to make it as a monoid instance so we have a free append function.

# Build and exec
stack build

stack exec project-name-exe

# Note
Use with care :) I did not handle the characters other than braces, square brackets and curly brackets 

