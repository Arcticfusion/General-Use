#!/bin/bash

# Comment Out Lines in *.nanorc that break with this version of nano

for f in "$@"
do
	# Test that the temporary file is empty
	# Empty if required
	if [ -e /tmp/comment_temp ]
	then
		rm /tmp/comment_temp
	fi

	# Read through each line, commenting lines with unknown comments
	# Write to a temporary file
	while read line
	do
		if (echo "$line" | egrep "(magic|comment|header|linter|normal)")
		then
			echo "# $line" >> /tmp/comment_temp
		elif (echo "$line" | egrep "^\s*syntax")
		then
			echo "$line" | sed -e 's/^\s*syntax\s\s*\(\w\w*\)\s\s*/syntax "\1" /' >> /tmp/comment_temp
		else
			echo "$line" >> /tmp/comment_temp
		fi
		
	done < "$f"
	
	# Move the contents from the temporary file to the original file name
	cat "/tmp/comment_temp" > "$f"
done
