#!/bin/bash
DIR="test_files/"
FILES=(`ls -p $DIR | grep -v /`)
MIMES=(`for FILE in ${FILES[@]}; do file -b --mime-type $DIR/$FILE; done`)

for IDX in ${!FILES[@]}
do

	if echo ${MIMES[$IDX]} | grep -q "image"; then
		echo "Image File Found"
		mkdir $DIR/Images 2>/dev/null
	
		if [[ $? = 0 ]]; then
			echo "Images Folder created"
		fi
	
		cp $DIR/${FILES[$IDX]} $DIR/Images/
		if [ $? -ne 0 ]; then
			echo "error copying file"
			exit 1
		else
			echo "File successfully copied"
		fi
	elif echo ${MIMES[$IDX]} | grep -q "video"; then
		echo "Video File Found"
		mkdir $DIR/Videos 2>/dev/null
	
		if [[ $? = 0 ]]; then
			echo "Videos Folder created"
		fi
	
		cp $DIR/${FILES[$IDX]} $DIR/Videos/
		if [ $? -ne 0 ]; then
			echo "error copying file"
			exit 1
		else
			echo "File successfully copied"
		fi
	fi

	

done
