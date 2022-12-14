#!/usr/bin/env bash

INSTALL_DIR=$1


DUNSTRC=$HOME/.config/dunst/dunstrc
mkdir -p $(dirname $DUNSTRC)
touch $DUNSTRC

DELIM="# from rofi-scripts -----"
END_DELIM="# end of rofi-scripts -----"
FROM=$(grep -n -m 1 "$DELIM" $DUNSTRC | cut -d: -f1)
TO=$(grep -n -m 1 "$END_DELIM" $DUNSTRC | cut -d: -f1)


if [[ -z $FROM || -z $TO ]]; then
    echo "$0: no delimiters found in $DUNSTRC"
else
    echo "$0: removing lines $FROM-$TO from $DUNSTRC"
    sed -i "${FROM},${TO}d" $DUNSTRC
fi

echo -en "
$DELIM
[Any]
     summary = \"*\"
     script = $INSTALL_DIR/dunst-callback.sh
$END_DELIM
" >> $DUNSTRC
