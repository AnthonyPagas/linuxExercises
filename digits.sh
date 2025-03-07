#!/bin/bash

#Initialize sum variable to store
sum=0

#Brace expression to range from 1000 - 2000
for number in {1000..2000}; do
    
    #regex to check for digits in set {0, 1}
    if [[ $number =~ ^[01]+$ ]]; then
        sum=$((sum + number))
    fi

done

echo "Sum: $sum"

