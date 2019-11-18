---
layout: assignment
title: "HW6: Internet calculator"
---

  - **Out on:** Monday, Nov 11th
  - **Due by:** Friday, Nov 22nd, 2019 by 10pm
  - **Collaboration:** None
  - **Grading:** Packaging 10%, Style 10%, Design 10% Functionality 70%

*Update 11/18* — note about `calc_eval` tolerating line ending characters, [Automated testing of your calculator implementation](#automated-testing-of-your-calculator-implementation) section

## Overview

In this assignment, you will develop a calculator program that accepts connections from clients over the Internet.

Get started by downloading [hw6.zip](hw6.zip).

## Goals of the assignment

The main goal of the assignment is to provide an opportunity to create a network-based application.

Although this will be a relatively simple program, it is representative of a larger class of network-enabled systems:

* It will have a protocol for communication between clients and server
* It will allow communication over a network (specifically, by accepting TCP connections from clients)
* It will enable access to data stored on the server (in the form of values of variables which persist between communication sessions)

## Grading rubric

The functionality component of the assignment (worth 70% of the total grade) will be determined as follows:

* Calculator functionality: 35%
* Basic network server functionality: 30%
* Variables persist between sessions: 5%

## Part 1: Calculator implementation

**Important**: Part 1 of the homework is purely local computation, with no I/O required (other than a provided demo program.)  You will need to complete it as a basis for Part 2.  So, get started on it right away!

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

**Important**: do **not** define the actual `struct Calc` data type in `calc.h`; it should be defined only in the implementation module (`calc.cpp` or `calc.c`).  `struct Calc` is an *opaque data type*, meaning that no implementation details are exposed to code using the type.

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

These example functions (which you are welcome to use) work by creating an instance of `CalcImpl` class and using an `evalExpr` member function to perform expression evaluation.

**Important**: your `calc_eval` function should tolerate line ending characters (`\r` and/or `\n`) at the end of the expression string.

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

### Calculator implementation hints

If you implement your calculator in C++ you could use the following function to break an input expression into tokens:

```cpp
std::vector<std::string> tokenize(const std::string &expr) {
    std::vector<std::string> vec;
    std::stringstream s(expr);

    std::string tok;
    while (s >> tok) {
        vec.push_back(tok);
    }

    return vec;
}

```

*Maybe more hints here eventually...*

## Part 2: Calculator server

The second part of your task is to implement a calculator server that listens
for client TCP connections, reads a sequence of expressions, and evaluates each
expression.

You should implement your calculator server in `calcServer.c`.  The program should
take a single command line argument, which specifies a TCP port.  The server
program should listen for incoming connections on the specified port, and then
communicate with the client in the same way that the `calcInteractive` program
does.  You can (and should!) adapt the `chat_with_client` function to use
in your server implementation.  Note that in addition to recognizing the special
`quit` command (which should cause the server to end the session with the
currently-connected client), the server `chat_with_client` function should
also recognize a `shutdown` command, which causes the server process to exit.

Note that the server should use a *single* instance of `struct Calc` for all
client connections.  That means that if a variable is assigned a value by
one session, the variable will have the same value in a subsequent session.
This sharing of variables between sessions will be important for the next assignment!

Note that there is no expectation that the server will support concurrent
connections: it is only expected to handle one client at a time.
This is a limitation you will address in the next assignment.

### Running and testing the server

Build the server program with the command

`make calcServer`

Here is an example of how the server program should be run:

```
./calcServer 47374
```

The command-line argument to `calcServer` is the TCP port on which the server
should listen for connections from clients.  You will need to choose a
TCP port number that is 1024 or greater (ports 0–1023 require superuser
privileges.)

To connect to the server, use the `telnet` program.  For example, to
connect to a `calcServer` listening on port 47374, use the command

```
telnet localhost 47374
```

The `telnet` program will allow you to interact with the server program,
more or less exactly the same way you interacted with the `calcInteractive`
program in the terminal.  Here is a transcript showing interaction with
the server program in two separate sessions (user input in **bold**):

<pre>
$ <b>telnet localhost 47374</b>
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
<b>2 + 3</b>
5
<b>a = 42</b>
42
<b>quit</b>
Connection closed by foreign host.
$ <b>telnet localhost 47374</b>
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
<b>a + 1</b>
43
<b>shutdown</b>
Connection closed by foreign host.
</pre>

A couple things to note about this example:

* The value of the variable `a` was assigned in the first session, and used in the second session
* The `shutdown` command in the second session, in addition to closing the client session, also shut down the server process

Also note that you will probably want to have two terminals running, one to run the server and one to run `telnet`.

### Automated testing of your calculator implementation

You can implement automated tests for your server implementation as follows.

Start by downloading [test\_server.sh](test_server.sh):

```bash
wget https://jhucsf.github.io/fall2019/hw/test_server.sh
```

Make it executable:

```bash
chmod a+x test_server.sh
```

Create a text file containing lines to send to the server:

```bash
echo "a = 2" > test_input.txt
echo "b = 3" >> test_input.txt
echo "a + b" >> test_input.txt
echo "quit" >> test_input.txt
```

Run the automated test:

```bash
./test_server.sh 30000 test_input.txt actual_output.txt
```

The output file should contain the responses generated by your server:

```bash
$ cat actual_output.txt
2
3
5
```

You should assume that there will be autograder tests that will test `test_server.sh` to test your server, so make sure this works.  Also note that as written, `test_server.sh` initiates only one connection to your server.  Your server should, in general, handle multiple connections from clients (in sequence.)  You may wish to create modified versions of `test_server.sh` which test multiple connections.

### Server implementation techniques

Using the functions defined in `csapp.h` and `csapp.c` will make adding network support significantly easier.  These functions are described in the BO textbook, and are generally useful for Unix systems programming.

The `Open_listenfd` function can be used to open a *server socket*, which is a special file descriptor that the server will use to listen for connections from clients.

The `Accept` function (which is simply a wrapper for the `accept` system call) causes the server to wait for a client connection request.  It returns a *client socket* file descriptor, which the server can use to communicate with the client process.  You can pass the second and third arguments of `Accept` as `NULL`, since they are used only to allow the server to determine the client's network address.

The client socket file descriptor is bidirectional, meaning it can be written to (to send data to the client) and also read from (to receive data from the client.)  The `chat_with_client` function from `calcInteractive.c` can be reused more or less verbatim in the server program: the only change you'll need to make is adding support for the `shutdown` command.

The server's `main` function should have a loop in which is repeatedly waits for client connections and uses `chat_with_client` to communicate with each accepted client.  The main loop should terminate (and the server program should exit) when a client issues the `shutdown` command.)

Make sure that when the server is done communicating with the client,
it closes the client socket file descriptor (otherwise the connection will stay open!)

## Deliverables

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

Make sure that the `Makefile` you submit can build `calcTest`, `calcInteractive`,
and `calcServer` targets.  Note that it is very likely that the autograder will
replace `calcTest.c` with a customized version containing some additional tests.
We highly recommend that you *don't* modify the `Makefile` in the project skeleton
code, other than setting appropriate dependencies for for `calc.o` according
to whether you implemented the calculator functionality in C or C++.

Upload your zipfile to Gradescope as **HW6**.  Make sure to include your name and
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
