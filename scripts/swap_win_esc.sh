#!/bin/bash

xmodmap -e 'keycode 9 = Caps_Lock'
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'clear Lock'

# bind Escape key with F7
xmodmap -e 'keycode 133 = F7'
