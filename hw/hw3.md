---
layout: assignment
title: "Homework 3: Machine-level Programming"
---

-   **Out on:** Friday, Sep 20th
-   **Due by:** Friday, Sep 27th by 10pm
-   **Collaboration:** None
-   **Grading:** Packaging 10%, Style 10%, Design 10%, Functionality 70%

*Preliminary assignment description, this could definitely change*

# Overview

In this assignment you will write machine-level programs for the SCRAM and 6502.

There is also an interesting hardware design problem involving an implementation of SCRAM.

## Expectation of original work

You might be able to find answers to all of these problems on the web.  Please resist the temptation to do this, and understand that turning in work that is not your original work is a violation of academic integrity.  All of these problems have straightforward solutions that you should be able to work out with a bit of thought and effort.

## 6502 and Logisim resources

See the [Resources](../index.html#resources) section of the Sec 02 CSF web page for some useful information about [Logisim evolution](https://github.com/reds-heig/logisim-evolution) and also the 6502 processor.

# Problem 1: SCRAM programming

For this problem, your task is to write a SCRAM program that will multiply two 8 bit integers to produce an 8 bit product.  Here are the requirements:

* The two integers to be multiplied should be stored in memory locations $D and $E (in decimal, memory locations 13 and 14)
* The product should be stored in memory location $F (in decimal, memory location 15)

Once the program has completed the multiplication, it should execute a HLT (Halt) instruction, which has the instruction code 0.  I.e., 

# Problem 2: 6502 programming
