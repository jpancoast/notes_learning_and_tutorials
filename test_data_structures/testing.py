#!/usr/bin/env python

import sys
import os
import pprint


def str_to_bool(s):
    if s.lower() == "true":
        return True
    elif s.lower() == "false":
        return False
    else:
        raise ValueError


def main(argv):
    pp = pprint.PrettyPrinter(indent=4)

    thing_1 = ["one", "two"]
    thing_2 = ["two", "one"]

    #       Broken, don't work
    #    thing_1 = ["one", [ "three", "four" ], "two"]
    #    thing_2 = ["two", "one", [ "three", "four" ]]

    thing_1.sort()
    thing_2.sort()

    pp.pprint(thing_1)
    print()
    pp.pprint(thing_2)

    print()
    print()
    if thing_1 == thing_2:
        print("they're equal")
    else:
        print("Not equal")


#    numbers = [1, 3, 4, 2]
#    # Sorting list of Integers in ascending
#
#    print(numbers)
#    numbers.sort()
#    print(numbers)


if __name__ == "__main__":
    main(sys.argv)
