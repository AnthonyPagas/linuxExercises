#!/bin/bash

#Check that 2 arguments are correctly provided
#1>&2 used to redirect for standard error
if [[ $# -ne 2 ]]; then

    echo "Argument Error: Use proper format of ./rm_n.sh <dir> <n>" >&2
    exit 1

fi

#Assign arguments to variables
dir="$1"
n="$2"

#Check existence of directory
if [[ ! -d "$dir" ]]; then

    echo "Directory Error: '$dir' doesn't exist." 1>&2
    exit 1

fi

#Check that <n> is valid
if ! [[ "$n" =~ ^[0-9]+$ ]]; then

    echo "Bytes Error: '$n' is not a valid byte number." 1>&2
    exit 1

fi

#Remove files larger than <n> bytes
find "$dir" -type f -size +"$n"c -exec rm {} +

echo "Success! All files in '$dir' larger than $n bytes were removed."
