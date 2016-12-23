#!/usr/bin/env python


'''
Fucking around with stuff from https://gist.github.com/bearfrieze/a746c6f12d8bada03589

The writer was using python 3.5, but I'm trying it with 2.7. Let's see how it works!
'''


import sys
import pprint

def main(argv):
    pp = pprint.PrettyPrinter(indent=4)

    bbs = '01110011001000000110111001101111001000000010000001101001001000000111001101101110001000000110010100100000001000000110100000100000001000000110010100100000011100100010000000100000011100000110110100100000011011110010000001100011'


    octets = [bbs[i:i+8] for i in range(0, len(bbs), 8)]

    pp.pprint(octets)

    chrs = [chr(int(octet, 2)) for octet in octets]

    pp.pprint(chrs)

    chrs = [c for c in chrs if c != ' ']

    pp.pprint(chrs)


    test = [c for c in [chr(int(octet, 2)) for octet in octets] if c != ' ']

    pp.pprint(test)

    message = ''.join(reversed(test))

    pp.pprint(message)



    droids = [
        {'name': 'BB-8', 'fav_jedi': 'Rey'},
        {'name': 'R2-D2', 'fav_jedi': 'Luke Skywalker'},
        {'name': 'C-3PO', 'fav_jedi': 'Luke Skywalker'},
    ]

    matches = [(a, b) for i, a in enumerate(droids) for b in droids[i + 1:]]
    scores = ['Great' if a['fav_jedi'] == b['fav_jedi'] else 'Miserable' for a, b in matches]

    pp.pprint(scores)

    #   I'm guessing the following only works in python 3.5
    #print(['{[name]} + {[name]} = {}'.format(*m, s) for m, s in zip(matches, scores)])
    #   in 2.7 it says:
    #     File "./comprehensions.py", line 51
    #   print(['{[name]} + {[name]} = {}'.format(*m, s) for m, s in zip(matches, scores)])  
    #SyntaxError: only named arguments may follow *expression

    pilots = [
        {'name': 'Luke Skywalker', 'ship_id': 0},
        {'name': 'Darth Vader', 'ship_id': 1},
    ]

    ships = [
        {'id': 0, 'model': 'T-65B X-wing'},
        {'id': 1, 'model': 'TIE Advanced x1'},
    ]

    pilot_ships = [(p, s) for p in pilots for s in ships if p['ship_id'] == s['id']]

    pp.pprint(pilot_ships)

    pp.pprint((['{[name]} -> {[model]}'.format(p, s) for p, s in pilot_ships]))


    episodes = {
        'Episode I': {'planets': ['Naboo', 'Tatooine', 'Coruscant']},
        'Episode II': {'planets': ['Geonosis', 'Kamino', 'Geonosis']},
        'Episode III': {'planets': ['Felucia', 'Utapau', 'Coruscant', 'Mustafar']},
        'Episode IV': {'planets': ['Tatooine', 'Alderaan', 'Yavin 4']},
        'Episode V': {'planets': ['Hoth', 'Dagobah', 'Bespin']},
        'Episode VI': {'planets': ['Tatooine', 'Endor']},
        'Episode VII': {'planets': ['Jakku', 'Takodana', 'Ahch-To']},
    }


    planets_set = {planet for episode in episodes.values() for planet in episode['planets']}

    pp.pprint(planets_set)


    jedis = [
        {'name': 'Ahsoka Tano', 'lightsaber_color': 'green'},
        {'name': 'Anakin Skywalker', 'lightsaber_color': 'blue'},
        {'name': 'Anakin Solo', 'lightsaber_color': 'blue'},
        {'name': 'Ben Skywalker', 'lightsaber_color': 'blue'},
        {'name': 'Count Duku', 'lightsaber_color': 'red'},
        {'name': 'Darth Craidus', 'lightsaber_color': 'red'},
        {'name': 'Darth Maul', 'lightsaber_color': 'red'},
        {'name': 'Darth Vader', 'lightsaber_color': 'red'},
        {'name': 'Jacen Solo', 'lightsaber_color': 'green'},
        {'name': 'Ki-Adi-Mundi', 'lightsaber_color': 'blue'},
        {'name': 'Kit Fisto', 'lightsaber_color': 'green'},
        {'name': 'Luke Skywalker', 'lightsaber_color': 'green'},
        {'name': 'Obi-Wan Kenobi', 'lightsaber_color': 'blue'},
        {'name': 'Palpatine', 'lightsaber_color': 'red'},
        {'name': 'Plo-Koon', 'lightsaber_color': 'blue'},
        {'name': 'Qui-Gon Jinn', 'lightsaber_color': 'green'},
        {'name': 'Yoda', 'lightsaber_color': 'green'},
    ]

    colors = [jedi['lightsaber_color'] for jedi in jedis]
    frequencies = {color: colors.count(color) for color in set(colors)}

    pp.pprint(frequencies)

    

if __name__ == "__main__":
    main(sys.argv)