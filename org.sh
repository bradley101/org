#!/bin/bash
DIR=.
FILES=$(ls -p $DIR | grep -v /)
MIMES=$(for FILE in $FILES; do file -b --mime-type $FILE; done)

echo ${FILES[@]}

for IDX in ${!FILES[@]}
do
	echo "$IDX" # -> ${FILES[$IDX]} has mime-type ${MIMES[$IDX]}"
done
