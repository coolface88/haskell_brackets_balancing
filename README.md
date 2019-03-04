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

# Problem 3

Software contracts, schedules, and delverables are notoriously difficult communicate between parties, especially if one of the parties is not itself specialized in software development.
    - In a language with a suitably strong type-system (Coq, Idris, Agda, lean, Haskell, Purescript, OCaML, F#, etc) , sketch an outline of a DSL for the formal specification of freelance software development contracts.
    - You should handle the following eventualities:
    
    - - The client will need to specify:
        1. some software with a timeline in some way
        2. some repercussions if certain deadlines are not met
        3. some repercussions if there is a defect in the deliverable
    - - The developer will need to: 
        1. Agree that the specification is sufficient
        2. agree that the timeline is reasonable ; or 
        3. disagree and ask the client to specify again
    - - The developer will need to provide the specified deliverables in time or she will breach the timeline and face some agreed upon contractual consequences
    - - The client will need to meet their payment or feedback obligations to the developer within an agreed upon timeline or face repercussions.
    
Do not need to implement all or any of the functions needed to construct or evaluate the dsl:  The goal is to develop the type semantics necessary to cover all needed states and provide a type-signiture or equivalent with an inline comment describing the logic.

# Build and exec
stack build

stack exec project-name-exe

