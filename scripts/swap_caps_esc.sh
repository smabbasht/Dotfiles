#!/bin/bash

# bind caps lock with Escape and escape key with caps lock, clear the default operation of both 
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'keycode 9 = Caps_Lock'
xmodmap -e 'clear Lock'
