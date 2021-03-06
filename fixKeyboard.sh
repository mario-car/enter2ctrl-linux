#!/bin/bash

# Swap Caps_Lock and Control_L
xmodmap -e "clear lock"
xmodmap -e "remove Control = Control_L"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add Control = Control_L"

xcape -e 'Control_L=Escape'

# Map an unused modifier's keysym to the Enters's keycode and make it a
# control modifier. It needs to be an existing key so that emacs won't
# spazz out when you press it. Hyper_L is a good candidate.
spare_modifier="Hyper_L"
xmodmap -e "keycode 36 = $spare_modifier"
xmodmap -e "remove mod4 = $spare_modifier" # hyper_l is mod4 by default
xmodmap -e "add Control = $spare_modifier"

# Map enter to an unused keycode (to keep it around for xcape to
# use).
xmodmap -e "keycode any = Return"

# Finally use xcape to cause the Return to generate a Return when tapped.
xcape -e "$spare_modifier=Return"


# Map an unused modifier's keysym to the Tabs's keycode and make it a
# control modifier. It needs to be an existing key so that emacs won't
# spazz out when you press it. Hyper_R is a good candidate.
spare_modifier2="Super_R"
xmodmap -e "keycode 23 = $spare_modifier2"
xmodmap -e "remove mod4 = $spare_modifier2" # super_r is mod4 by default
xmodmap -e "add mod4 = $spare_modifier2"

# Map Tab to an unused keycode (to keep it around for xcape to
# use).
xmodmap -e "keycode any = Tab"

# Finally use xcape to cause the Tab to generate a Tab when tapped.
xcape -e "$spare_modifier2=Tab"


# Map an unused modifier's keysym to the spacebar's keycode and make it a
# control modifier. It needs to be an existing key so that emacs won't
# spazz out when you press it. Hyper_L is a good candidate.
spare_modifier3="Hyper_R"
xmodmap -e "keycode 65 = $spare_modifier3"
xmodmap -e "remove mod4 = $spare_modifier3" # hyper_r is mod4 by default
xmodmap -e "add Control = $spare_modifier3"

# Map space to an unused keycode (to keep it around for xcape to
# use).
xmodmap -e "keycode any = space"

# Finally use xcape to cause the space bar to generate a space when tapped.
xcape -e "$spare_modifier3=space"


# Map an unused modifier's keysym to the '\' keycode and make it a
# super modifier. It needs to be an existing key so that emacs won't
# spazz out when you press it. Shift_R looks like a good candidate.
spare_modifier4="Shift_R"
xmodmap -e "remove Shift = $spare_modifier4"
xmodmap -e "keycode 51 = $spare_modifier4"
xmodmap -e "keycode 62 = Shift_L"
xmodmap -e "add mod4 = $spare_modifier4"


# Map Tab to an unused keycode (to keep it around for xcape to
# use).
xmodmap -e "keycode any = backslash"

# Finally use xcape to cause the Tab to generate a Tab when tapped.
xcape -e "$spare_modifier4=backslash"
