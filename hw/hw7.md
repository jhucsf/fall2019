---
layout: assignment
title: "HW7: Multithreaded Internet calculator"
---

  - **Out on:** Friday, Nov 22nd
  - **Due by:** Friday, Dec 6th, 2019 by 10pm
  - **Collaboration:** None
  - **Grading:** Packaging 10%, Style 10%, Design 10% Functionality 70%

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

In general, it makes sense for server applications to handle connections from
multiple clients simultaneously.  Threads are a useful mechanism for handling
multiple client connections because they allow the code which communicates
with each client to execute concurrently.

In your main server loop, create a thread for each accepted client connection.
Use `pthread_create` to create the client threads.  You can let the client
threads be detached (i.e., by having them call `pthread_detach` with their
own thread id.)  You do not need to place any upper limit on the number of
threads that can be active simultaneously (although in practice that's a
good idea.)

You can test that your server can handle multiple client sessions simultaneously
by running 2 (or more) `telnet` sessions connecting to the server.

Note that as with the server from [HW6](hw6.html), all connections should share
a common `struct Calc` instance.  This means that a variable set by one client
is visible to other clients, and in fact, can be considered a simple form
of communication between clients.

The following screen capture shows two instances of telnet connecting to the
same `calcServer` (using [GNU Screen](https://www.gnu.org/software/screen/)
as a split-screen terminal):

<center>
<video width="720" controls>
  <source src="calcServer.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>
</center>

### Using synchronization to protect shared data

Any time two thread access shared data, such that one or both threads
might modify the shared data, *synchronization* is typically necessary
to ensure the integrity of the shared data.

In your calculator server, the data structure you used to store the
values of variables (quite possibly an STL `map` object) will be accessed
by multiple client threads.  Without synchronization, this data structure
could be corrupted.

To allow safe access from multiple client threads, use a mutex or semaphore
to protect the shared data in your `struct Calc` implementation.  The following
guidelines should help you think about how you will need to modify your program:

* Your calculator data type (e.g., `class CalcImpl` if you used C++) will need
  to have a mutex or semaphore as a member variable (i.e., a
  variable whose type is `pthread_mutex_t` or `sem_t`)
* In initializing a calculator instance, the mutex or semaphore should be
  initialized (e.g., call `pthread_mutex_init` or `sem_init`)
* In destroying a calculator instance, the appropriate cleanup function
  (`pthread_mutex_destroy` or `sem_destroy`) should be called
* Any code accessing or modifying the data structure storing the values of
  variables should be executed with the mutex or semaphore held for exclusive
  access; this will cause threads to take turns accessing the shared data
  (achieving *mutual exclusion*)

Critical sections (regions of code where mutual exclusion is necessary)
should be protected with calls to `pthread_mutex_lock`/`pthread_mutex_unlock`
or `sem_wait`/`sem_post`.

Note that access to data that is either

* *not* shared between client threads, or
* is shared between client threads, but never modified

does not need to be protected.

**Important requirement**: In a file called `README.txt`, briefly describe
how you made the calculator instance's shared data safe to access from multiple
threads.  Indicate what kind of synchronization object you used, and how
you determined which regions of code were critical sections.

### Clean shutdown (extra credit!)

Details on how to approach the extra credit coming soon.

## Deliverables

You will need to make one modification to your `Makefile` from HW6.  Change
the rule to build `solution.zip` from:

```make
solution.zip :
	zip -9r solution.zip *.c *.cpp *.h Makefile
```

to

```make
solution.zip :
	zip -9r solution.zip *.c *.cpp *.h Makefile README.txt
```

This change will ensure that your `README.txt` is submitted.

To submit your work, run the command

```
make solution.zip
```

and upload `solution.zip` to Gradescope as **HW7**.


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
