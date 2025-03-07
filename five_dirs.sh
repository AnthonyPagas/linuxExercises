#!/bin/bash

#Make directory five
mkdir five

#Make five subdirectories five/dir1 through five/dir5 through first loop
for num in {1..5}; do
    mkdir "five/dir$num"
    
    #Nested loop to create file1 to file4 in each subdirectory
    for num_file in {1..4}; do
        path="five/dir$num/file$num_file"

        #Create file + the corresponding digit
        for ((i=1; i<=num_file; i++)); do
            echo "$num_file" >> "$path"
        done
    done
done
