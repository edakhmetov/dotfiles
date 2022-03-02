#!/bin/sh

greet="Welcome, Back"
color="ffffff"
wrong_pass="Incorrect, Try Again"
font="Iosevka Font"
background=/usr/share/backgrounds/4.jpg

i3lock \
--nofork \
--ignore-empty-password \
--indicator \
--bar-indicator \
--bar-pos="1070" \
--bar-base-width="20" \
--bar-orientation=horizontal \
--bar-color=151515 \
--ringver-color=$color \
--ringwrong-color=$color \
--bshl-color=$color \
--keyhl-color=$color \
--clock \
--time-color=$color \
--time-str="%H:%M:%S" \
--time-font=$font \
--time-size=72 \
--time-color=$color \
--date-color=$color \
--date-str="%A, %d %B" \
--date-color=$color \
--date-font=$font \
--date-size=18 \
--verif-font=$font \
--verif-size=24 \
--verif-color=$color \
--wrong-font=$font \
--wrong-size=24 \
--wrong-text="$wrong_pass" \
--wrong-color=$color \
-i "$background"
