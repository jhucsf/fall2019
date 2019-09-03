#! /usr/bin/env python

# Python script to prove the correctness of a boolean expression
# in Conjunctive Normal Form (i.e., that its behavior exactly
# matches the truth table from which it was generated.)

def bool_to_int(x):
    return 1 if x else 0

def int_to_bool(x):
    return True if x==1 else False

def Func(a, b, c):
    a = int_to_bool(a)
    b = int_to_bool(b)
    c = int_to_bool(c)
    result = ((not ((not a) and (not b) and (not c))) and
              (not (a and (not b) and (not c))) and
              (not (a and b and (not c))) and
              (not (a and (not b) and c)) and
              (not (a and b and c)))
    return bool_to_int(result)

def print_row(a, b, c):
    print("{} {} {}   {}".format(a, b, c, Func(a, b, c)))

print("A B C Output")
print("------------")
print_row(0, 0, 0)
print_row(0, 1, 0)
print_row(1, 0, 0)
print_row(1, 1, 0)
print_row(0, 0, 1)
print_row(0, 1, 1)
print_row(1, 0, 1)
print_row(1, 1, 1)
