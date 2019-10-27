---
layout: assignment
title: "HW5: x86-64 hexdump"
---

  - **Out on:** Monday, Oct 28th, 2019
  - **Due by:** Friday, Nov 8th, 2019 by 10pm
  - **Collaboration:** None
  - **Grading:** Packaging 10%, Style 10%, Design 10% Functionality 70%

*Preliminary assignment description, not official yet!*

Acknowledgment: this assignment is based on the [Fall 2018 HW5](https://www.cs.jhu.edu/~phf/2018/fall/cs229/simple-x86_64.html) by Peter Froehlich.

## Overview

This assignment is **all** about hacking **native**
[x86\_64](https://en.wikipedia.org/wiki/X86-64) assembly code. For
obvious reasons, **you’ll need a *64-bit* Lubuntu 18.04 LTS reference
system;** you cannot do this assignment on a 32-bit install.
(Note that the ugrad machines should work, but testing on an
Ubuntu 18.04-derived system or virtual machine is recommended
since it matches what the autograder will be using.)

You’ll use the standard
[gcc](http://en.wikipedia.org/wiki/GNU_Compiler_Collection)/[gas](http://en.wikipedia.org/wiki/GNU_Assembler)
toolchain and you **must** use AT\&T syntax, **not** Intel syntax.

You should use the following starter code: [hw5.zip](hw5.zip)

Note that for *all* problems the *full* x86\_64 conventions regarding
register usage (arguments, results, caller-saved vs. callee-saved, etc.)
are in effect\! (Of course regular calls differ from system calls in
this regard.)

### Lost?

If you find yourself wondering how to use a system call,
you can use the `man` command to look up information. For
example, to find out how the `read` system call works, use
`man 2 read`. Sadly the `man` pages don’t describe the details
equire to call system calls from assembly language, but [this
post](http://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
has everything you’ll need regarding register conventions and system
call numbers.

### Warning\!

Undocumented assembly code **will** lose points. You don’t have to
comment **every** line, but at least every “coherent chunk” of assembly
should have a comment or two. In particular you **must** describe where
you get what data from, especially when it comes to functions and their
parameters/results. **You have been warned\!**

## Hexdump’s Revenge

Remember the `hex` program from
[Assignment 1](hw1.html)?
You’re about to write that program **again**, but this time you’ll do it
in **x86\_64 assembly** using **only system calls** and **no standard
library**\!

The specification for `hex` is **exactly** the same as given on
[Homework 1](hw1.html) which means you can also reuse all your old test cases
(assuming you had some). Of course you’ll now have to approach the
problem a little differently, for example you’ll need to use the `read`
and `write` system calls (with suitable buffers\!) instead of `getchar`
or `printf` or whatnot.

The starter code has two files related to this problem. The files `hex.S`
and `hexFuncs.S` are the assembly language modules used to implement
the `hex` program.  The `hex.S` module should contain *only* the `main`
function for the `hex` program.  The `hexFuncs.S` module should contain
useful functions that you can call from `main`.

## Unit testing

Whenever you write functions to incorporate into a program,
is extremely important to have confidence that they behave correctly.
Unit tests are a very effective way to test the behavior of functions
to make sure they meet their specfications.

In this assignment, you will use a simple unit testing framework
called [TCTest](https://github.com/daveho/tctest).  You can read
the [README](https://github.com/daveho/tctest/blob/master/README.md)
and [demo program](https://github.com/daveho/tctest/blob/master/demo.c)
for specific information about how it works, but if you've used unit
testing frameworks such as [JUnit](https://junit.org), it should be
fairly straightforward.

You should use unit tests to test the functions in `hexFuncs.S`.
Add your unit tests to the `hexTest.c` source file.
For each function that you want to test, you will need to write
a C language function declaration for the function.  You can use
the `addLongs` example function and its associated tests as an example.

To compile and run the unit tests, run the following commands:

```
make hexTest
./hexTest
```

**Important advice**: Writing complete programs in
assembly language is hard.  Using unit tests, you can adopt a
test-driven approach where you implement one assembly language
function at a time, and test them to ensure correct operation.
*Using this approach will make developing the `hex` program vastly
easier.*

Here is a concrete example.  A useful function for the hexdump
program is one that converts a byte value to a two-digit hex number.
In assembly language, we could define this function like this:

```
/*
 * Convert a byte value to a two-digit hex string.
 *
 * Parameters:
 *   val - a byte value
 *   s - a pointer to a char buffer with enough room for a
 *       string of length 2
 */
	.globl byteToHex
byteToHex:
	/* code would go here... */
```

To unit test this function, we make several changes to `hexTest.c`.
First, we add a function prototype (right below the one for the
example `addLongs` function):

```c
void byteToHex(long val, char *s);
```

We also add a function prototype for a new test function called
`testByteToHex`, just below the prototype for `testAddLongs`:

```c
void testByteToHex(TestObjs *objs);
```

We add `testByteToHex` to the test functions to be executed from `main`:

```c
TEST(testByteToHex);
```

Finally, we add a definition of `testByteToHex`:

```c
void testByteToHex(TestObjs *objs) {
        char buf[10];

        byteToHex(0x29, buf);
        ASSERT(0 == strcmp(buf, "29"));

        byteToHex(0xC, buf);
        ASSERT(0 == strcmp(buf, "0c"));
}
```

Assuming that the `byteToHex` function was implemented correctly, when
we compile and run `hexTest`, we should see the following output:

```
testAddLongs...passed!
testByteToHex...passed!
All tests passed!
```

If you'd like to see the entire `hexTest.c` with the test for `byteToHex`,
here it is: [hexTest.c](hw5/hexTest.c)

## Program-level testing

In addition to unit testing individual functions, you should test
the program as a whole the same way you tested the program you
wrote for [Homework 1](hw1.html).  In general, for any input file
(text, binary, etc.), the command

<pre>
./hex &lt; <i>inputfile</i>
</pre>

should produce exactly the same output as

<pre>
xxd -g 1 &lt; <i>inputfile</i>
</pre>

We encourage you to test your program with a variety of inputs,
including (but not limited to):

* empty file
* small files
* large files
* files with sizes that are a multiple of 16
* files with sizes that aren't a multiple of 16
* text files
* binary files

## x86-64 tips and tricks

Here are some tips and tricks in no particular order.

Don't forget that you need to prefix constant values with `$`.  For example,
if you want to set register `%r10` to 16, the instruction is

```
movq $16, %r10
```

and not

```
movq 16, %r10
```

If you want to use a label as a pointer (address), prefix it with
`$`.  For example,

```
movq $sHexDigits, %r10
```

would put the address that `sHexDigits` refers to in `%r10`.

If you want to load or store the *data* in a variable named by a
label, then do *not* prefix it with `$`.  For example, if you want
to load the value of the (64 bit) variable `bCount` into `%rdi`,
use the instruction

```
movq bCount, %rdi
```

When calling a function, the stack pointer (`%rsp`) must contain an address
which is a multiple of 16.  However, because the `callq` instruction
pushes an 8 byte return address on the stack, on entry to a function,
the stack pointer will be "off" by 8 bytes.  You can subtract 8 from
`%rsp` when a function begins and add 8 bytes to `%rsp` before returning
to compensate.  (See the example `addLongs` function.)  Pushing an
odd number of caller-saved registers also works.

If you want to define read-only string constants, the `.rodata` section
is the right place for them.  For example:

```
        .section .rodata
sHexDigits: .string "0123456789abcdef"
```

The `.equ` assembler directive is useful for defining constant values,
for example:

```
.equ BUFSIZE, 16
```

You might find the following source code comment useful for reminding
yourself about calling conventions:

```
/*
 * Notes:
 * Callee-saved registers: rbx, rbp, r12-r15
 * Subroutine arguments:  rdi, rsi, rdx, rcx, r8, r9
 */
```

In Unix and Linux, standard input is file descriptor 0.

Linux system calls do *not* preserve `%rcx` or `%r11`, so make sure you save them on the stack if their contents need to be preserved across a system call.

*More tips coming soon, maybe?*

## Deliverables

Submit a zipfile containing your complete project.  The recommended
way to do this is to run the command `make solution.zip`.  This
will create a file called `solution.zip` with all of the required
files.  **Important**: all of the files in the zipfile must be
at the top level, not a subdirectory.  For example, if your
zipfile is called `solution.zip` and you run the command `unzip -l solution.zip`
to list its contents, you should see something like the following output:

```
TODO: expected output of unzip -l solution.zip
```

Upload your zipfile to Gradescope as **HW5**.
Make sure to include your name and
email address in *every* file you turn in (well, in every file for which
it makes sense to do so anyway!)

## Grading

For reference, here is a short explanation of the grading criteria; some
of the criteria don’t apply to all problems, and not all of the criteria
are used on all assignments.

**Packaging** refers to the proper organization of the stuff you hand
in, following both the guidelines for Deliverables above as well as the
general submission instructions for assignments on
[Piazza](http://piazza.com/jhu/fall2019/601229).

**Style** refers to C/C++/assembly programming style, including things
like consistent indentation, appropriate identifier names, useful
comments, suitable documentation, etc. Simple, clean, readable code is
what you should be aiming for. Make sure you follow the style guide
posted on [Piazza](http://piazza.com/jhu/fall2019/601229)\!

**Design** refers to proper modularization (functions, modules, classes,
etc.) and an appropriate choice of algorithms and data structures.

**Performance** refers to how fast/with how little memory your programs
can produce the required results compared to other submissions.

**Functionality** refers to your programs being able to do what they
should according to the specification given above; if the specification
is ambiguous, ask for clarification\! (It also refers to you simply
doing the required work, which may not be programming alone.)

**If your programs cannot be built you will get no points whatsoever. If
your programs cannot be built without warnings using the required
compiler options given on
[Piazza](http://piazza.com/jhu/fall2019/601229) we will take off 10%
(except if you document a *very* good reason). If your programs cannot
be built using `make` we will take off 10%. If `valgrind` detects memory
errors in your programs, we will take off 10%. If your programs fail
miserably even once, i.e. terminate with an exception of any kind or
dump core, we will take off 10% (for each such case).**
