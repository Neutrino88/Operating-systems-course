#!/bin/bash

while [[ 1 ]] ;do
    echo "
 -------------------- 
|     MENU:          |
| 1 - open the VI    |
| 2 - open the NANO  |
| 3 - open the LINKS |
| 4 - exit           |
 --------------------"

    read menu_item

    case "$menu_item" in
        1 ) vi ;;
        2 ) nano ;;
        3 ) links ;;
        4 ) exit 0 ;;
        * ) echo "Uncorrect item! Try again!"
    esac
done
