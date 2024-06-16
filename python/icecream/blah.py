#!/usr/bin/env python

from icecream import ic

def add(x, y):
    return x + y

def myfunction(value):
    if value % 2 == 0:
        ic()
        return True
    else:
        ic()
        return False
    
def output_to_file(text):
    with open('debug.txt', 'a') as file:
        file.write(text + '\n')

ic.configureOutput(prefix='DEBUG: ', outputFunction=output_to_file, includeContext = True)

ic(add(2, 3))
ic(add(10,10))