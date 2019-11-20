---
layout: default
title: "Home page"
---

## What is this web page?

This web page supplements [Prof. Koehn's CSF web page](https://www.cs.jhu.edu/~phi/csf).  It is mainly intended for Section 02 of the course, taught by [David Hovemeyer](https://www.cs.jhu.edu/~daveho).

We'll be using Piazza for Q&amp;A and other important information about the course: <https://piazza.com/jhu/fall2019/601229>

## Readings

Recommended textbooks:

* HCW: [How Computers Work](http://www.fastchip.net/howcomputerswork/p1.html), Robert Young, 2009
* PH: Computer Organization and Design, 5th edition, David A. Patterson and John L. Hennessy, 2014
* BO: Computer Systems, 3rd edition, Randal E. Bryant and David R. O'Hallaron, 2016
* CODE: Code, Charles Petzold, 2000

## Assignments

Homework assignments are based on assignments designed by [Peter Froehlich](https://www.cs.jhu.edu/~phf) for [his version of the class](https://www.cs.jhu.edu/~phf/2018/fall/cs229/).

[Homework 1: Warmup](hw/hw1.html), due Friday, Sep 13th by 10pm

[Homework 2: Digital Logic](hw/hw2.html), due Friday, Sep 20th by 10pm

> Solution: [HW2\_soln.zip](hw/HW2_soln.zip)

[Homework 3: Machine-level Programming](hw/hw3.html), due Friday, Sep 27th by 10pm

> Solution: [HW3\_soln\_partial.zip](hw/HW3_soln_partial.zip)

[Homework 4: MIPS, cache simulator](hw/hw4.html), due <strike>Monday, Oct 28th by 10pm</strike> Tuesday, Oct 29th by 10pm

[Homework 5: x86-64 hexdump](hw/hw5.html), due <strike>Friday, Nov 8th by 10pm</strike> Monday, Nov 11th by 10pm

[Homework 6: Internet calculator](hw/hw6.html), due Friday, Nov 22nd by 10pm

## Resources

**Logisim evolution (digital logic simulator)**:

* [Logisim evolution web page](https://github.com/reds-heig/logisim-evolution)
* Executable jar file download [logisim-evolution.jar](http://reds-data.heig-vd.ch/logisim-evolution/logisim-evolution.jar) (requires Java)
* [Beginner's tutorial](http://www.cburch.com/logisim/docs/2.1.0/guide/tutorial/index.html): for older version of Logisim, but definitely still relevant
* [Youtube video #1](https://www.youtube.com/watch?v=1IEEYddYIxg): shows wiring and testing a very simple circuit
* [Youtube video #2](https://www.youtube.com/watch?v=WDq5L0xeSnY): another good introductory video on using Logisim evolution

**C64 and 6502 resources**: see the [C64 and 6502 resources page](c64.html)

## Grading

* Each assignment (total of 7): 10%
* Midterm: 10%
* Final exam: 20%

Note also the [late days policy](notes/latedays.html).  There is no grade deduction for a late submission as long as you are using one of the late days to which you're entitled.

## Schedule

The schedule is tentative and subject to change.  Any changes will be announced in class.

Date      | Topic                                     | Readings
--------- | ----------------------------------------- | --------
Th Aug 29 | Introduction: Electricity and Circuits ([slides](lec/lec01.pdf), [markup](lec/lec01-ink.pdf))    | CODE Chapters 4, 8, 10, 11; HCW page basic 1, basic 4
          | **Digital Circuits**
Fr Aug 30 | Boolean Algrebra ([slides](lec/lec02.pdf), [markup](lec/lec02-ink.pdf), [note about CNF](notes/cnf.html))| CODE Chapter 8, 15
Mo Sep 2  | *Labor day, no class*
We Sep 4  | Addition and Subtraction ([slides](lec/lec03.pdf), [markup](lec/lec03-ink.pdf))                  | CODE Chapter 12-13
Fr Sep 6  | Feedback and Flip-Flops ([slides](lec/lec04.pdf), [markup](lec/lec04-ink.pdf), [logisim circuits](res/demoSequentialLogic.circ))                   | CODE Chapter 14
Mo Sep 9  | Memory ([slides](lec/lec05.pdf), [markup](lec/lec05-ink.pdf), [logisim circuits](res/demoMemory.circ))          | CODE Chapter 16
We Sep 11 | Instructions ([slides](lec/lec06.pdf), [markup](lec/lec06-ink.pdf), [logisim circuits](res/demoInstructions.circ))    | CODE Chapter 17
          | **SCRAM**
Fr Sep 13 | SCRAM Introduction ([slides](lec/lec07.pdf), [markup](lec/lec07-ink.pdf), [logisim circuits](res/demoSCRAM-corrected.circ))                        | [SCRAM handout](https://www.cs.jhu.edu/~phi/csf/scram/dewdney-omnibus-scram.pdf)
Mo Sep 16 | SCRAM Instructions ([slides](lec/lec08.pdf), [logisim circuits](res/demoSCRAM2.circ))                        | 
          | **6502**
We Sep 18 | Introduction ([slides](lec/lec09.pdf), [markup](lec/lec09-ink.pdf))                            | [Reference](http://obelisk.me.uk/6502/index.html); [Commodore C64 Emulation](https://www.cs.jhu.edu/~phi/csf/c64-emulation/);<br> [Re-engineering the 6502 Video](https://www.youtube.com/watch?v=fWqBmmPQP40)
Fr Sep 20 | Stack ([slides](lec/lec10.pdf), [markup](lec/lec10-ink.pdf))                                     | [JavaScript 6502 assembler and simulator](http://skilldrick.github.io/easy6502/)
Mo Sep 23 | Interrupts and Bus ([slides](lec/lec11.pdf), [markup](lec/lec11-ink.pdf))                     | [6502 Diagram](https://www.cs.jhu.edu/~phi/csf/slides/6502-diagram-db-sb-ad.png); [Fun Glitch](https://www.youtube.com/watch?v=fj9u00PMkYU&feature=youtu.be)
          | **MIPS**
We Sep 25 | Introduction ([slides](lec/lec12.pdf), [markup](lec/lec12-ink.pdf))                              | PH 2.1-2.3, 2.5-2.7
Fr Sep 27 | Fast Arithmetic ([slides](lec/lec13.pdf), [markup](lec/lec13-ink.pdf))                          | PH 2.10, 3.3, 3.4
Mo Sep 30  | Pseudo Instructions and Functions ([slides](lec/lec14.pdf))        | PH 2.8
          | **Midterm**
We Oct 2 | Midterm Review                            | [Midterm 2016](res/midterm2016.pdf), [Midterm 2018](res/midterm2018.pdf), [6502 review](res/6502_review.html)
Fr Oct 4 | Midterm
          | **MIPS** (continued)
Mo Oct 7  | Pipelining ([slides](lec/lec15.pdf), [markup](lec/lec15-ink.pdf))                                | PH 4.5-4.6
We Oct 9  | Data Hazards  ([slides](lec/lec16.pdf), [markup](lec/lec16-ink.pdf))                             | PH 4.7
Fr Oct 11 | Branch Prediction  ([slides](lec/lec17.pdf), [markup](lec/lec17-ink.pdf))                        | PH 4.8-4.9
Mo Oct 14 | Cache Basics  ([slides](lec/lec18.pdf), [markup](lec/lec18-ink.pdf))                             | PH 5.1-5.3
We Oct 16 | Cache Control ([slides](lec/lec19.pdf))                            | PH 5.4, 5.8-5.9
Fr Oct 18 | *Fall break, no class*
Mo Oct 21 | Cache Policies ([slides](lec/lec20.pdf), [markup](lec/lec20-ink.pdf))                           | PH 5.7
We Oct 23 | Floating Point Numbers  ([slides](lec/lec21.pdf), [markup](lec/lec21-ink.pdf))                   | 	PH 3.5
          | **x86**
Fr Oct 25 | x86 Introduction ([slides](lec/lec22.pdf), [markup](lec/lec22-ink.pdf))                         | BO 3.1, online links: [1](http://www.cs.virginia.edu/~evans/cs216/guides/x86.html) [2](https://www.nayuki.io/page/a-fundamental-introduction-to-x86-assembly-programming) [3](http://download-mirror.savannah.gnu.org/releases//pgubook/ProgrammingGroundUp-1-0-booksize.pdf) [4](http://www.plantation-productions.com/Webster/www.artofasm.com/Windows/index.html) [5](http://patater.com/gbaguy/x86asm.htm) [Intel Manual](http://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf)
Mo Oct 28 | Compiling C code ([slides](lec/lec23.pdf), [markup](lec/lec23-ink.pdf))                         | BO 3.2-3.6
We Oct 30 | Functions and Stack ([slides](lec/lec24.pdf), [markup](lec/lec24-ink.pdf))                      | BO 3.7
Fr Nov 1  | Linking ([slides](lec/lec25.pdf), [markup](lec/lec25-ink.pdf))                                  | BO 7
Mo Nov 4  | Process Control ([slides](lec/lec26.pdf), [markup](lec/lec26-ink.pdf))                          | BO 8
We Nov 6  | *Work day*
Fr Nov 8  | Virtual Memory ([slides](lec/lec27.pdf))                           | BO 9.1-9.5
Mo Nov 11  | Virtual Memory II ([slides](lec/lec28.pdf), [markup](lec/lec28-ink.pdf))                        | BO 9.6-9.9
          | **Networks**
We Nov 13  | Unix I/O ([slides](lec/lec29.pdf), [markup](lec/lec29-ink.pdf)) | BO 10
Fr Nov 15  | IP Protocol, Unix Sockets ([slides](lec/lec30.pdf), [server.c](res/server.c))                 | BO 11.1-11.4
Mo Nov 18 | Application protocols, HTTP  ([slides](lec/lec31.pdf), [webserver.zip](res/webserver.zip), [webclient.zip](res/webclient.zip))            | BO 11.5-11.6
          | **Threads and concurrency**
We Nov 20 | Concurrency with processes, I/O multiplexing ([slides](lec/lec32.pdf), [mp\_webserver.zip](res/mp_webserver.zip)) | BO 12.1-12.2
Fr Nov 22 | Concurrency with threads ([slides](lec/lec33.pdf), [mt\_webserver.zip](res/mt_webserver.zip), [mandelbrot.zip](res/mandelbrot.zip))                 | BO 12.3
Mo Nov 25 | *Thanksgiving vacation, no class*
We Nov 27 | *Thanksgiving vacation, no class*
Fr Nov 29 | *Thanksgiving vacation, no class*
Mo Dec 2  | Synchronizing access to data              | BO 12.4-12.5
We Dec 4  | Parallelism, concurrency issues           | BO 12.7
Fr Dec 6  | Final exam review
