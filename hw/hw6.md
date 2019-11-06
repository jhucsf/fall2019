---
layout: assignment
title: "HW6: Internet calculator"
---

  - **Out on:** Monday, Nov 11th
  - **Due by:** Friday, Nov 22nd, 2019 by 10pm
  - **Collaboration:** None
  - **Grading:** Packaging 10%, Style 10%, Design 10% Functionality 70%

*Preliminary assignment description, not official yet*

## Overview

In this assignment, you will develop a calculator program that accepts connections from clients over the Internet.

Get started by downloading [hw6.zip](hw6.zip).

## Part 1: Calculator implementation

**Important**: Part 1 of the homework is purely local computation, with no I/O required (network or otherwise).  You will need to complete it as a basis for Part 2.  So, get started on it right away!

For Part 1, you will need to implement the following functions:

```c
struct Calc *calc_create(void);
void calc_destroy(struct Calc *calc);
int calc_eval(struct Calc *calc, const char *expr, int *result);
```

The `calc_create` function creates an instance of the `struct Calc` data type and returns a pointer to it.

The `calc_destroy` function destroys an instance of the `struct Calc` data type, by deallocating its memory.

The `calc_eval` function evaluates an expression stored as a C character string in `expr`, saving the result of evaluating the expression in the variable pointed to by `result`.  If the evaluation succeeds, `calc_eval` should return 1.  If the evaluation fails because `expr` is invalid, `calc_eval` should return 0.

The types of invalid expressions that should be detected are:

* Invalid syntax (the form of the expression isn't valid)
* Undefined variable (a variable was used, but it wasn't previously assigned a value)
* Attempt to divide by 0

Your calculator implementation should do operations exclusively using the `int` data type.

The following kinds of expressions should be supported:

* *operand*
* *operand* *op* *operand*
* *var* = *operand*
* *var* = *operand* *op* *operand*

An *operand* is either a literal integer or a variable name. A variable name (*var*) is a sequence of one or more alphabetic characters (`A`-`Z` or `a`-`z`.)

An *op* is one of the following operators: `+` (addition), `-` (subtraction), `*` (multiplication), `/` (division).

Space characters should be ignored. Your calculator should assume that all tokens (operands, operators, and `=`) will be separated by at least one space character.  So, for example,

> `a + 4`

is a valid expression, but

> `a+4`

is not a valid expression.

A `struct Calc` object should have a dictionary mapping variable names to their values.  The `=` operation assigns a value to a variable, creating an entry in the dictionary if one didn't exist previously.  When a variable name is used as an operand in an expression, the value of the variable should be looked up in the dictionary.

You can implement your `struct Calc` data type in either C or C++.  If you use C++, you can make a class that inherits from an empty `struct Calc`.  For example:

```cpp
struct Calc {
};

class CalcImpl : public Calc {
    // code...
};
```

**Important**: do **not** define the actual `struct Calc` data type in `calc.h`; it should be defined only in the implementation module (`calc.cpp` or `calc.c`).

If you use C++, make sure that your `calc_` functions have `extern "C"` linkage, so that they can be called from C code.  For example, you might define them as follows:

```cpp
extern "C" struct Calc *calc_create(void) {
    return new CalcImpl();
}

extern "C" void calc_destroy(struct Calc *calc) {
    CalcImpl *obj = static_cast<CalcImpl *>(calc);
    delete obj;
}

extern "C" int calc_eval(struct Calc *calc, const char *expr, int *result) {
    CalcImpl *obj = static_cast<CalcImpl *>(calc);
    return obj->evalExpr(expr, *result);
}
```

### Unit tests

The `calcTest` program contains a fairly complete set of unit tests for the `calc_` functions.  You can build and run it using the commands

```
make calcTest
./calcTest
```

If the tests succeed, you should see the following output:

```
testEvalLiteral...passed!
testAssignment...passed!
testComputation...passed!
testComputationAndAssignment...passed!
testUpdate...passed!
testInvalidExpr...passed!
All tests passed!
```

### Interactive tests

The `calcInteractive` program allows the user to interactively enter expressions (one per line).  Each expression is evaluated and the result printed.  Expressions that are invalid result in the error message `Error`.  Entering the command `quit` causes the calculator to exit.

Compile and run `calcInteractive` using the following commands:

```
make calcInteractive
./calcInteractive
```

Example transcript (user input in **bold**):

<pre>
<b>1 + 1</b>
2
<b>a = 1 + 1</b>
2
<b>a * 5</b>
10
<b>a = a + 7</b>
9
<b>a</b>
9
<b>b = a / 3</b>
3
<b>b</b>
3
<b>4 / 0</b>
Error
<b>+ 4</b>
Error
<b>quit</b>
</pre>

## Part 2: Calculator server

Description coming soon...

## Submitting

Submit a zipfile containing your complete project.  The recommended
way to do this is to run the command `make solution.zip`.  This
will create a file called `solution.zip` with all of the required
files.  **Important**: all of the files in the zipfile must be
at the top level, not a subdirectory.  For example, if your
zipfile is called `solution.zip` and you run the command `unzip -l solution.zip`
to list its contents, you should see something like the following output:

```
Archive:  solution.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
     1600  2019-11-06 09:00   calcInteractive.c
     2155  2019-11-06 09:02   calcServer.c
     3054  2019-11-06 09:33   calcTest.c
    24035  2019-11-06 07:41   csapp.c
     3319  2019-11-05 11:52   tctest.c
     4528  2019-11-05 12:55   calc.cpp
      604  2019-11-06 07:37   calc.h
     6621  2019-11-06 08:01   csapp.h
     3954  2019-11-05 11:47   tctest.h
     1208  2019-11-06 09:38   Makefile
---------                     -------
    51078                     10 files
```

Upload your zipfile to Gradescope as **HW6**.
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
