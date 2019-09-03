---
layout: default
title: "Note about CNF"
---

In the [slides for lecture 2](../lec/lec02.pdf), the following truth table is presented as an example of an arbitrary boolean function:

A | B | C | Output
- | - | - | ------
0 | 0 | 0 | 0
0 | 1 | 0 | 1
1 | 0 | 0 | 0
1 | 1 | 0 | 0
0 | 0 | 1 | 1
0 | 1 | 1 | 1
1 | 0 | 1 | 0
1 | 1 | 1 | 0

Translating this function into a boolean expression in Conjunctive Normal Form (CNF) involves constructing a subexpression for each row in the truth table where the function's output is 0.  The purpose of these subexpressions is generate a 0 for each specific truth table row where a the function's output is 0, and generate a 1 otherwise.  The important thing to realize is that these subexpressions *always generate a 1* for the *other* rows in the truth table: i.e., they only generate a 0 for one specific row where the function's output should be 0.

Here is the truth table with the subexpressions:

A | B | C | Output | Subexpression
- | - | - | ------ | -------------
0 | 0 | 0 | 0      | NOT ((NOT A) AND (NOT B) AND (NOT C))
0 | 1 | 0 | 1      | 
1 | 0 | 0 | 0      | NOT (A AND (NOT B) AND (NOT C))
1 | 1 | 0 | 0      | NOT (A AND B AND (NOT C))
0 | 0 | 1 | 1      | 
0 | 1 | 1 | 1      | 
1 | 0 | 1 | 0      | NOT (A AND (NOT B) AND C)
1 | 1 | 1 | 0      | NOT (A AND B AND C)

Let's dive deeper into the subexpression for the first row (where A, B, and C are all 0):

> NOT ((NOT A) AND (NOT B) AND (NOT C))

It's 0 when A, B, and C are each 0, false otherwise.  Another way to think about the meaning of this expression is

> "Not the first row of the truth table"

since it generates 0 for the first row of the truth table, and 1 for every other row.  So, the effective meaning of each subexpression is

A | B | C | Output | Subexpression
- | - | - | ------ | -------------
0 | 0 | 0 | 0      | "Not the first row of the truth table"
0 | 1 | 0 | 1      | 
1 | 0 | 0 | 0      | "Not the third row of the truth table"
1 | 1 | 0 | 0      | "Not the fourth row of the truth table"
0 | 0 | 1 | 1      | 
0 | 1 | 1 | 1      | 
1 | 0 | 1 | 0      | "Not the seventh row of the truth table"
1 | 1 | 1 | 0      | "Not the eighth row of the truth table"

The CNF expression for the overall function is formed by *conjoining* the subexpressions, i.e., connecting them with AND:

> (NOT ((NOT A) AND (NOT B) AND (NOT C))) AND<br>
> (NOT (A AND (NOT B) AND (NOT C))) AND<br>
> (NOT (A AND B AND (NOT C))) AND<br>
> (NOT (A AND (NOT B) AND C)) AND<br>
> (NOT (A AND B AND C))

This means, effectively,

> "Not the first row of the truth table" AND<br>
> "Not the third row of the truth table" AND<br>
> "Not the fourth row of the truth table" AND<br>
> "Not the seventh row of the truth table" AND<br>
> "Not the eighth row of the truth table"

Hopefully, it should be clear that the overall expression generates a 1 for every row of the truth table where a 0 is *not* generated, and a 0 for every row of the truth table where a 0 *is* generated.

An a concrete demonstration that the CNF expression is correct (i.e., that its behavior exactly corresponds to the truth table), here is a [Python program](https://github.com/jhucsf/fall2019/blob/gh-pages/notes/cnf.py) which generates the following output:

```
A B C Output
------------
0 0 0   0
0 1 0   1
1 0 0   0
1 1 0   0
0 0 1   1
0 1 1   1
1 0 1   0
1 1 1   0
```
