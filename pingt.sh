#!/bin/bash

while true; do
    echo "pingt - simple internet test"
    echo
    ping -c 4 google.com
    echo
    echo "simple internet test done!"
    echo
    echo "press [a] key to try again"
    echo "press [s] key to exit"
    echo -n "> "

    # read one character only
    read -n1 choice
    echo

    case "$choice" in
        a|A) continue ;;  # go back and ping again
        s|S) break ;;     # exit
        *) continue ;;    # ignore invalid keys and repeat
    esac
done
