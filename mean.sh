#!/bin/bash

#Check that arguments used are correct
if [[ $# -lt 1 || $# -gt 2 ]]; then

    echo "Argument Error: Use proper format of ./mean.sh <column> [file.csv]" >&2
    exit 1

fi

#Assignment to variable assignment / process command-line arguments
column="$1"
#Read from stdin if no file given
file="${2:-/dev/stdin}"

#Check that column number is valid
if ! [[ "$column" =~ ^[0-9]+$ ]]; then

    echo "Column Error: A valid number must be entered for column argument." >&2
    exit 1

fi

#Check for file existence
if [[ -n "$2" && ! -f "$file" ]]; then

    echo "File Error: '$file' is not an existing file found." >&2
    exit 1

fi

#Calculate mean
#Use cut to select the required column + use tail to skip header
cut -d',' -f"$column" "$file" | tail -n +2 | {
 
    sum=0 
    count=0
 
    while read value; do

        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))

    done

    if [[ $count -gt 0 ]]; then

        mean=$(echo "scale=5; $sum / $count" | bc)
        echo "Mean: $mean"

    else

        echo "Mean Error: No numeric data present in $column column." >&2
        exit 1

    fi
}
