#!/bin/bash

# bind caps lock with Escape and escape key with caps lock, clear the default operation of both 
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'keycode 9 = Caps_Lock'
xmodmap -e 'clear Lock'

# swap F7 and Windows key
xmodmap -e 'keycode 133 = F7'

# keycode of F7
# xmodmap -e 'keycode -23 = Super_L'
