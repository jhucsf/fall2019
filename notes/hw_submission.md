---
layout: assignment
title: "Homework submission details"
---

This web page discusses expectations for homework submission.  Please read it carefully!

The information on this page could be updated.  We will let you know in class and via [Piazza](http://piazza.com/jhu/fall2019/601229) if it does.

## Where to submit your work

All homeworks will be submitted to [Gradescope](https://www.gradescope.com/courses/61318) by uploading a zipfile.  The specific assignment description will indicate the name of the assignment within Gradescope.  For example, [Homework 1](../hw/hw1.html) will be submitted as the assignment named **HW1**.

## Preparing the submission zipfile

The zipfile you submit should contain all of the files required to satisfy the requirements of the assignment.  For programs, files needed to compile the program, such as the `Makefile`, should be included.  When your zipfile is unzipped, the files should be extracted into the current directory, not a subdirectory.

As a concrete example, let's say that you are submitting the C program you wrote for [Homework 1](../hw/hw1.html).  At a minimum your submission should contain two files, `hex.c` and `Makefile`.  If your submission zipfile is called `solution.zip`, then running the command `unzip -l solution.zip` to list its contents should look something like this:

```
Archive:  solution.zip
  Length      Date    Time    Name
---------  ---------- -----   ----
      326  2019-09-03 11:26   Makefile
     3066  2019-09-03 11:25   hex.c
---------                     -------
     3392                     2 files
```

(The exact output will vary, especially file sizes and dates/times.)  **Check your zipfile before you submit it!**

## Include your name and email address

As appropriate, add your name and email address to human-readable files such as source code files.

## Add a README.txt

It's not a bad idea to add a `README.txt` file to your submission.  You could use this to explain anything important you feel that the graders will need to know about your submission.

Ensuring that the `README.txt` gets added might require modifying the `Makefile`.  For example, for Homework 1, change the command that reads

> `zip -9r $@ Makefile hex.c`

to

> `zip -9r $@ Makefile hex.c README.txt`
