---
layout: assignment
title: "HW7: Multithreaded Internet calculator"
---

  - **Out on:** Friday, Nov 22nd
  - **Due by:** Friday, Dec 6th, 2019 by 10pm
  - **Collaboration:** None
  - **Grading:** Packaging 10%, Style 10%, Design 10% Functionality 70%

*Preliminary assignment description, not official yet*

## Overview

In this assignment you will make your `calcServer` program from [HW6](hw6.html)
multithreaded, so it can handle connections from multiple clients simultaneously.

Get started by making a copy of your code for HW6 in a new directory.  You will
modify both `calcServer.c` and either `calc.cpp` or `calc.c` (depending on
whether you used C++ or C to implement the calculator functionality.)

## Goals of the assignment

The goals of the assignment are:

* Use threads to handle concurrent client connections
* Use synchronization to allow multiple threads to access shared data

## Grading rubric

The functionality component of the assignment (worth 70% of the total grade)
will be determined as follows:

* Using threads to handle concurrent client connections: 45%
* Using synchronization to protect shared data: 25%

There is also an extra credit option: if you can make your `calcServer`
program shut down cleanly after receiving a `shutdown` command from
a client, *exiting only after all client connections have finished*, you will
receive an extra 10 points.

## Your task

Your main tasks are (1) to use multiple threads to handle client connections,
and (2) to use synchronization to protect shared data.

### Using threads for client connections

TODO

### Using synchronization to protect shared data

TODO

## Deliverables

TODO

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
