---
layout: assignment
title: "HW5: x86-64 hexdump"
---

  - **Out on:** Monday, Oct 28th, 2019
  - **Due by:** TBD
  - **Collaboration:** None
  - **Grading:** Packaging 10%, Style 10%, Design 10% Functionality 70%

*Preliminary assignment description, not official yet!*

Acknowledgment: this assignment is based on the [Fall 2018 HW5](https://www.cs.jhu.edu/~phf/2018/fall/cs229/simple-x86_64.html) by Peter Froehlich.

## Overview

This assignment is **all** about hacking **native**
[x86\_64](https://en.wikipedia.org/wiki/X86-64) assembly code. For
obvious reasons, **you’ll need a *64-bit* Lubuntu 18.04 LTS reference
system;** you cannot do this assignment on a 32-bit install. You’ll use
the standard
[gcc](http://en.wikipedia.org/wiki/GNU_Compiler_Collection)/[gas](http://en.wikipedia.org/wiki/GNU_Assembler)
toolchain and you **must** use AT\&T syntax, **not** Intel syntax.

For some problems we give you a bunch of starter code on Piazza already,
for others you’re on your own. It’s **highly** recommended that you
actually **read** the starter code, especially any explanatory comments
it might contain, before changing it.

Note that for *all* problems the *full* x86\_64 conventions regarding
register usage (arguments, results, caller-saved vs. callee-saved, etc.)
are in effect\! (Of course regular calls differ from system calls in
this regard.)

### Lost?

If you find yourself wondering how to use a C function or a system call,
you can use the `man` command to look up information about either. For
example, to find out how the `putchar` function from the [C standard
library](http://en.wikipedia.org/wiki/C_standard_library) works, use
`man 3 putchar`; to find out how the `read` system call works, use
`man 2 read` and so on. Sadly the `man` pages don’t describe the details
required for system calls, but [this
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

The specification for `hex` is **exactly** the same as given on the
warmup assignment which means you can also reuse all your old test cases
(assuming you had some). Of course you’ll now have to approach the
problem a little differently, for example you’ll need to use the `read`
and `write` system calls (with suitable buffers\!) instead of `getchar`
or `printf` or whatnot.

The starter code on [Piazza](http://piazza.com/jhu/fall2018/600229) has
two files related to this problem. The file `hex.S` is for you to fill
in your assembly code. There’s also a `Makefile` (actually the same as
for Problem 1 above) that you can use to build the `hex` program.

## Deliverables

Please follow the submission instructions as detailed on
[Piazza](http://piazza.com/jhu/fall2018/600229). Be sure to include a
`Makefile` that sets the appropriate compiler flags and builds **all
programs** by default. **Finally, make sure to include your name and
email address in *every* file you turn in (well, in every file for which
it makes sense to do so anyway)\!**

## Grading

For reference, here is a short explanation of the grading criteria; some
of the criteria don’t apply to all problems, and not all of the criteria
are used on all assignments.

**Packaging** refers to the proper organization of the stuff you hand
in, following both the guidelines for Deliverables above as well as the
general submission instructions for assignments on
[Piazza](http://piazza.com/jhu/fall2018/600229).

**Style** refers to C/C++/assembly programming style, including things
like consistent indentation, appropriate identifier names, useful
comments, suitable documentation, etc. Simple, clean, readable code is
what you should be aiming for. Make sure you follow the style guide
posted on [Piazza](http://piazza.com/jhu/fall2018/600229)\!

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
[Piazza](http://piazza.com/jhu/fall2018/600229) we will take off 10%
(except if you document a *very* good reason). If your programs cannot
be built using `make` we will take off 10%. If `valgrind` detects memory
errors in your programs, we will take off 10%. If your programs fail
miserably even once, i.e. terminate with an exception of any kind or
dump core, we will take off 10% (for each such case).**
