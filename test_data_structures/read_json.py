#!/usr/bin/env python

import sys
import os
import pprint
import json


def main(argv):
    pp = pprint.PrettyPrinter(indent=4)

    # Opening JSON file
    f = open("json/test_data.json")

    # returns JSON object as
    # a dictionary
    data = json.load(f)

    pp.pprint(data)
    print(type(data))
    print()

    for key in data:
        print(key, type(key), type(data[key]))


if __name__ == "__main__":
    main(sys.argv)
