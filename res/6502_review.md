---
layout: assignment
title: "6502 review problems"
---

This page has 6502 review problems to use studying for the midterm exam.

You can refer to the [6502 Instruction Set](https://www.masswerk.at/6502/6502_instruction_set.html) reference for details on the various 6502 instructions.  The lecture slides are also a useful reference.

## Problem 1

Note: this is a somewhat challenging problem.

Write a 6502 subroutine called `reverse_bits` which reverses the bits in the A register, returning its result in the A register.  Reversing bits means that the value of bit 0 becomes bit 7, bit 1 becomes bit 6, bit 2 becomes bit 5, etc.  (Think of the bits of A as an array of one-bit values, and reverse the contents of the array.)

It should be called using code like

<pre>
LDA #<i>value</i>
JSR reverse&#95;bits
; bits in A are now reversed
</pre>

Here are some example values to try (to substitute for *value* in the calling code above):

Value | Binary | Value<br>(reversed) | Binary<br>(reversed)
----- | ------ | ---------------- | -----------------
$5a | 01011010 | $5a | 01011010
$68 | 01101000 | $16 | 00010110
$98 | 10011000 | $19 | 00011001
$21 | 00100001 | $84 | 10000100
$c3 | 11000011 | $c3 | 11000011
$fb | 11111011 | $df | 11011111
$be | 10111110 | $7d | 01111101

**Hints**: You may want to use memory locations for temp variables.  You may use the X and Y registers freely.

Test your function using [Easy 6502](http://skilldrick.github.io/easy6502/).  You can use calling code as shown above.  Be sure to add a `BRK` instruction after the calling code (i.e., after the `JSR` instruction) to avoid re-entering your `reverse_bits` function.

## Problem 2

Write a 6502 subroutine called `times3`.  It should modify the value of the A register so that it is three times its original value.

Example calling code:

<pre>
LDA #<i>value</i>
JSR times3
; value of A is now 3&times;<i>value</i>
</pre>

For example, if you set A to `$11` (decimal 17), after calling `times3` A should be `$33` (decimal 51).
