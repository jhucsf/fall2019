---
layout: assignment
title: "Homework 3: Machine-level Programming"
---

-   **Out on:** Friday, Sep 20th
-   **Due by:** Friday, Sep 27th by 10pm
-   **Collaboration:** None
-   **Grading:** Packaging 10%, Style 10%, Design 10%, Functionality 70%

*Preliminary assignment description, this is imcomplete and could definitely change*

# Overview

In this assignment you will write machine-level programs for the SCRAM and 6502 and a disassembler for the SCRAM system.

There is also an interesting hardware design problem involving an implementation of SCRAM.

## Expectation of original work

You might be able to find answers to all of these problems on the web.  Please resist the temptation to do this, and understand that turning in work that is not your original work is a violation of academic integrity.  All of these problems have straightforward solutions that you should be able to work out with a bit of thought and effort.

## 6502 and Logisim resources

See the [Resources](../index.html#resources) section of the Sec 02 CSF web page for some useful information about [Logisim evolution](https://github.com/reds-heig/logisim-evolution) and also the 6502 processor.

# Problem 1: SCRAM programming

For this problem, your task is to write a SCRAM program that will multiply two 8 bit integers to produce an 8 bit product.  Here are the requirements:

* The two integers to be multiplied should be stored in memory locations $D and $E (in decimal, memory locations 13 and 14)
* The product should be stored in memory location $F (in decimal, memory location 15)

Once the program has completed the multiplication, it should execute a HLT (Halt) instruction, which has the instruction code 0.  I.e., any instruction where the code bits (the 4 highest bits) are all zero will be treated as a HLT instruction.

You can test your program using a simple SCRAM simulator: [scram.jar](scram.jar)

To run the simulator, use the command

> <code>java -jar scram.jar "<i>initial memory contents</i>"</code>

For <code><i>initial memory contents</i></code>, specify a sequence of byte values in hexadecimal to store in the SCRAM's 16 memory locations.

As an example, here is the simulator running a program that adds the values 17 and 42, then stores the sum in memory location $F (15):

```
java -DmaxCycles=1000 -jar scram.jar "1D 5E 3F 00 00 00 00 00 00 00 00 00 00 11 2A 00"
Start: 1d 5e 3f 00 00 00 00 00 00 00 00 00 00 11 2a 00 A=00 PC=0
0000 : 1d 5e 3f 00 00 00 00 00 00 00 00 00 00 11 2a 00 A=11 PC=1
0001 : 1d 5e 3f 00 00 00 00 00 00 00 00 00 00 11 2a 00 A=3b PC=2
0002 : 1d 5e 3f 00 00 00 00 00 00 00 00 00 00 11 2a 3b A=3b PC=3
0003 : 1d 5e 3f 00 00 00 00 00 00 00 00 00 00 11 2a 3b A=3b PC=4
Halted after 4 cycles
```

The simulator shows the initial machine state (labeled `Start:`), and then shows the machine state after each time step of the simulation.  The machine state consists of the values of the 16 memory locations and the value of the accumulator (`A`) and program counter (`PC`).  All values are displayed in hexadecimal.  Note that when the simulation terminates (due to the execution of the HLT instruction at address $3), the sum $3b (decimal 59) is stored at address $F.

You can use the `-DmaxCycles=` option to specify an upper limit on the number of program instructions to be executed.  This is useful in case your code has a runaway loop.

The first component of your submission for this problem should be a plain text file called `Problem1MachineCode.txt` containing a sequence of hexadecimal bytes (i.e., the initial memory contents.)  For example, if you were submitting a program to add the numbers 17 and 42 and store the sum at address $F (which you're obviously not, this is just an example of what we want to see!), the contents of your `Problem1MachineCode.txt` might be:

```
1D 5E 3F 00 00 00 00 00 00 00 00 00 00 11 2A 00
```

**Extremely important**: `Problem1MachineCode.txt` should contain *only* memory content bytes.  Do *not* put your name and email address in this file!

Note that you can specify whatever data values you want for the operands at addresses $D and $E.  However, you should assume that we will test your program with a variety of data values, by changing the values stored at these locations.

You should also submit a plain text file called `Problem1AssemblyCode.txt` that contains an assembly language version of your program.  For example, the assembly language for the 17+42 program might look like this:

```
J. Student
jstuden1@jhu.edu

                     ; Awesome SCRAM program to compute 17+42

0: 1D        LDA D   ; load first operand to accumulator
1: 5E        ADD E   ; add second operand to accumulator
2: 3F        STA F   ; store sum at $F
3: 00        HLT     ; end of program
4: 00                ; unused
5: 00                ; unused
6: 00                ; unused
7: 00                ; unused
8: 00                ; unused
9: 00                ; unused
A: 00                ; unused
B: 00                ; unused
C: 00                ; unused
D: 11                ; data operand 1
E: 2A                ; data operand 2
F: 00                ; storage for sum
```

The exact format of your assembly code listing isn't critical, but it should indicate the encoding of each code and data byte, and show the assembly code for bytes containing program instructions.

# Problem 2: SCRAM disassembler

Coming soon!

# Problem 3: 6502 programming

Coming soon!

# Problem 4: SCRAM hardware

Coming soon!

# Submitting

Coming soon!

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
