---
layout: assignment
title: "Homework 2: Digital Logic"
---

-   **Out on:** TBD
-   **Due by:** TBD
-   **Collaboration:** None
-   **Grading:** Packaging 10%, Style 10%, Design 10%, Functionality 70%

*Preliminary assignment description, this could change*

# Overview

Yeah

# Problem 1

An *n*-input boolean function takes *n* input bits and produces one output bit for each combination of input bits.  A boolean function can be specified precisely by writing a truth table, which specifies the output bit produced for each combination of input bits.

Considering the case of 1-input boolean functions, we can write four distinct truth tables (note that A is the input and Q is the output):

```
A | Q   A | Q   A | Q   A | Q
-----   -----   -----   -----
0 | 0   0 | 0   0 | 1   0 | 1
1 | 0   1 | 1   1 | 0   1 | 1
```

Since these are the only truth tables we can write for a 1-input boolean function, this implies that there are only *four* (4) 1-input boolean functions.

Generalize this result by determining a formula that precisely expresses the number of distinct *n*-input boolean functions.  Justify your answer briefly.

Hints:

* There are 16 2-input boolean functions
* An *n*-bit boolean function has 2<sup><i>n</i></sup> rows

# Problem 2

Consider the following truth table describing a 3-input boolean function (A, B, and C are inputs, Q is the output):

```
A B C | Q
----------
0 0 0 | 1
0 0 1 | 0
0 1 0 | 0
0 1 1 | 0
1 0 0 | 1
1 0 1 | 0
1 1 0 | 0
1 1 1 | 1
```

**(a)** Write a boolean formula in *Disjunctive Normal Form* (DNF) that generates the correct output truth value (Q) for each combination of inputs (A, B, and C).

**(b)** Design a circuit which implements your DNF formula from part (a) using logic gates (AND, OR, NOT).  Your circuit should implement the formula in a straightforward manner.  "Straightforward" means that, *generally*, each operator in the formula should be a distinct gate in the circuit.  Two simplifications which you *may* make are

1. You can use a single NOT gate per input to generate the negated versions of A, B, and C
2. You can use AND and OR gates with more than 2 inputs

# Problem 3

Priority encoder?

# Problem 4

Design a shift register.

# Submitting

TODO

# Grading

TODO
