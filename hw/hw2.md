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

1. You can use a single NOT gate per input to generate the negated versions of A, B, and C as needed
2. You can use AND and OR gates with more than 2 inputs

# Problem 3

Design a circuit to implement a *priority encoder* with three inputs.  The inputs are called I1, I2, and I3.  There are two outputs, Q0 and Q1.  The outputs encode a two-bit binary number, with Q0 being the low bit (one's place) and Q1 being the high bit (two's place).  The output of the priority encoder should be as follows:

* If I3, I2, and I1 are all 0, then the output is 0 (Q1=0 and Q0=0)
* If I1 is 1 and both I3 and I2 are 0, then the output is 1 (Q1=0 and Q0=1)
* If I2 is 1 and I3 is 0, then the output is 2 (Q1=1 and Q0=0)
* If I3 is 1, then the output is 3 (Q1=1 and Q0=1)

The priority encoder outputs the number (1, 2, or 3) of the "highest priority" input whose value is 1, or outputs 0 if none of the inputs are set to 1.

**(a)** Write boolean formulas using the operators AND, OR, and NOT which compute the values of Q1 and Q0 as a function of the inputs I1, I2, and I3.

**(b)** Design a circuit which implements the formulas you specified in part (a).

Hint: it will probably be helpful to make a truth table showing the values of Q0 and Q1 for each combination of input values.

# Problem 4

Design an 8-bit *shift register* as follows.

The shift register has 3 inputs called DataIn, SClock, and RClock.  It has 8 outputs called Q0, Q1, ..., through Q7.

Internally, the shift register contains 8 D-type edge-triggered flip-flops (a.k.a. D-type edge-triggered latches).  Call these flip-flips F0 through F7.

On each rising edge of SClock (transition from 0 to 1):

* F7 stores the data output of F6
* F6 stores the data output of F5
* etc. for F5 through F1 (F*n* stores the data output of F*n*-1)
* F0 stores the value of DataIn

The shift register also has 8 D-type edge-triggered flip-flops, called R0 through R7.  On each rising edge of RClock (transition from 0 to 1),

* R0 stores the data output of F0
* R1 stores the data output of F1
* etc. for R2 through R7 (they store the data outputs of F2 through F7)

The outputs of R0 through R7 generate the shift register outputs Q0 through Q7.

Your circuit can (and should) use D-type edge-triggered flip-flops as a fundamental building block: i.e., you don't need to construct them out of gates.

Your circuit may show the R0 through R7 flip-flops as a single 8-bit register with 8-bit-wide data input and data output.

# Submitting

TODO

# Grading

TODO
