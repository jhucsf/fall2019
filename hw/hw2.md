---
layout: assignment
title: "Homework 2: Digital Logic"
---

-   **Out on:** Wednesday, Sep 11th (?)
-   **Due by:** Friday, Sep 20th by 10pm (?)
-   **Collaboration:** None
-   **Grading:** Functionality 80%, Design 10%, Packaging 10%

*Preliminary assignment description, this could change*

# Overview

In this assignment, you will work on four problems related to digital logic design, which we covered in Lectures 1–5.

Please make sure you read the [Submitting](#submitting) section carefully, since it specifies how you should prepare your answer to each problem, and how you should package your answers to be submitted to Gradescope.

# Problem 1: Counting boolean functions (10%)

An *n*-input boolean function takes *n* input bits and produces one output bit for each combination of input bits.  A boolean function can be specified precisely by writing a truth table, which specifies the output bit produced for each combination of input bits.

Considering the case of 1-input boolean functions, we can write four distinct truth tables (note that A is the input and Q is the output):

```
A | Q   A | Q   A | Q   A | Q
-----   -----   -----   -----
0 | 0   0 | 0   0 | 1   0 | 1
1 | 0   1 | 1   1 | 0   1 | 1
```

Since these are the only truth tables we can write for a 1-input boolean function, this implies that there are only *four* (4) 1-input boolean functions.

Generalize this result by determining a formula that precisely expresses the number of distinct *n*-input boolean functions, as a function of *n*.  Justify your answer briefly.

Hints:

* There are 16 2-input boolean functions
* An *n*-input boolean function has 2<sup><i>n</i></sup> rows

# Problem 2: DNF (30%)

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

# Problem 3: Priority encoder (30%)

Design a circuit to implement a *priority encoder* with three inputs.  The inputs are called I1, I2, and I3.  There are two outputs, Q0 and Q1.  The outputs encode a two-bit binary number, with Q0 being the low bit (one's place) and Q1 being the high bit (two's place).  The output of the priority encoder should be as follows:

* If I3, I2, and I1 are all 0, then the output is 0 (Q1=0 and Q0=0)
* If I1 is 1 and both I3 and I2 are 0, then the output is 1 (Q1=0 and Q0=1)
* If I2 is 1 and I3 is 0, then the output is 2 (Q1=1 and Q0=0)
* If I3 is 1, then the output is 3 (Q1=1 and Q0=1)

The priority encoder outputs the number (1, 2, or 3) of the "highest priority" input whose value is 1, or outputs 0 if none of the inputs are set to 1.

**(a)** Write boolean formulas using the operators AND, OR, and NOT which compute the values of Q1 and Q0 as a function of the inputs I1, I2, and I3.

**(b)** Design a circuit which implements the formulas you specified in part (a).  The circuit should show the three inputs (I1, I2, I3) and the two outputs (Q0, Q1).

Hint: it will probably be helpful to make a truth table showing the values of Q0 and Q1 for each combination of input values.

# Problem 4: Shift register (30%)

Design an 8-bit *shift register* as follows.

The shift register has 3 inputs called DataIn, SClock, and RClock.  It has 8 outputs called Q0, Q1, ..., through Q7.

Internally, the shift register contains 8 D-type edge-triggered flip-flops (a.k.a. D-type edge-triggered latches).  Call these flip-flops F0 through F7.

On each rising edge of SClock (transition from 0 to 1):

* F7 stores the data output of F6
* F6 stores the data output of F5
* etc. for F5 through F1 (F*n* stores the data output of F*n*-1)
* F0 stores the value of DataIn

The shift register also has an additional 8 D-type edge-triggered flip-flops, called R0 through R7.  On each rising edge of RClock (transition from 0 to 1),

* R0 stores the data output of F0
* R1 stores the data output of F1
* etc. for R2 through R7 (they store the data outputs of F2 through F7)

The outputs of R0 through R7 generate the shift register outputs Q0 through Q7.

Your circuit can (and should) use D-type edge-triggered flip-flops as a fundamental building block: i.e., you don't need to construct them out of gates.

Your circuit may show the R0 through R7 flip-flops as a single 8-bit register with 8-bit-wide data input and data output.

# Submitting

Prepare your answers for each problem as follows.

For the *written* problems (Problems 1 and 2a), prepare either a *plain text file* or a *PDF file* with your solution.  The file should be named <code>Problem<i>N</i>.txt</code> or <code>Problem<i>N</i>.pdf</code>, where *N* is the problem number (1 or 2a).

For the problems where you are asked to design a circuit (Problems 2b, 3, and 4), perpare either a [Logisim evolution](https://github.com/reds-heig/logisim-evolution) file or a *neatly drawn* diagram in PDF format.  The file should be named <code>Problem<i>N</i>Circuit.circ</code> or <code>Problem<i>N</i>Circuit.pdf</code>, where *N* is the problem number (2b, 3, or 4).

We highly recommend using Logisim evolution for the circuit design problems, since it will allow you to test your work interactively!

For the circuit design problems:

* Make sure that all inputs and outputs are labeled appropriately
* Make sure that you use standard symbols for all logic gates and elements (this is only a concern if you are drawing your circuit design)

Package all of the files you have prepared for the problems (note that there are *two* files for Problem 2) into a single zip file.  All of the files should be added to the top-level of the zip file (i.e., not in a subdirectory.)  For example, the command you use to prepare the zip file might be

```
zip hw2.zip Problem1.txt Problem2a.txt Problem2bCircuit.circ Problem3Circuit.circ Problem4Circuit.circ
```

Submit your zipfile to Gradescope as **HW2**.

# Grading

For reference, here is a short explanation of the grading criteria; some
of the criteria don’t apply to all problems, and not all of the criteria
are used on all assignments.

**Packaging** refers to the proper organization of the stuff you hand
in, following both the guidelines for Deliverables above as well as the
general submission instructions for assignments on
[Piazza](http://piazza.com/jhu/fall2019/601229).

**Style** refers to C programming style, including things like
consistent indentation, appropriate identifier names, useful comments,
suitable documentation, etc. Simple, clean, readable code is what you
should be aiming for. Please see the [Coding style guidelines](../notes/style.html).

**Design** refers to proper modularization (functions, modules, etc.)
and an appropriate choice of algorithms and data structures.

**Performance** refers to how fast/with how little memory your programs
can produce the required results compared to other submissions.

**Functionality** refers to your programs being able to do what they
should according to the specification given above; if the specification
is ambiguous, ask for clarification! (It also refers to you simply doing
the required work, which may not be programming alone.)

**If your programs cannot be built you will get no points whatsoever.** If
your programs cannot be built without warnings using the required
compiler options given on
[Piazza](http://piazza.com/jhu/fall2019/601229) we will take off 10%
(except if you document a *very* good reason). If your programs cannot
be built using `make` we will take off 10%. If `valgrind` detects memory
errors in your programs, we will take off 10%. If your programs fail
miserably even once, i.e. terminate with an exception of any kind or
dump core, we will take off 10% (for each such case).
