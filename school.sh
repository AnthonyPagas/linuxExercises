#!/bin/bash

#Use cat to write Property_Tax_Roll.csv to stdout
cat "Property_Tax_Roll.csv" | \

#Use grep to select only those lines containing MADISON SCHOOLS
grep "MADISON SCHOOLS" | \

#Use cut to select only the TotalAssessedValue (7th) column.
cut -d',' -f7 | \

#Pipe that column to a brace-enclosed compound expression (“group command”)
#that finds the sum and then the average.
{
    #Intialize sum & count
    sum=0
    count=0

    while read value; do
#Check only digits 0-9
        if [[ $value =~ ^[0-9]+$ ]]; then
            sum=$((sum + value))
            count=$((count + 1))
        fi
    done

    #Calculate average and use sum
    if [[ $count -gt 0 ]]; then
        avg=$((sum / count))
        echo "Sum: $sum"
        echo "Average: $avg"
    else
        echo "Data not found"
    fi
} > "sum_average.txt"
