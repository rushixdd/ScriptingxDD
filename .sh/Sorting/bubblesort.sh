#!/bin/bash

MAXCOUNT=1000
count=1
RANDOM=180

while [ "$count" -le $MAXCOUNT ]; do
 arr[$count]=$RANDOM
 let "count += 1"
done
printf "Array in original order: \n${arr[*]}\n" 

# Performing Bubble sort 
bubblesort (){
	for ((i = 0; i<1000; i++))
		do
		for((j = 0; j<1000-i; j++))
		do
		
		    if [[ ${arr[$j]} -gt ${arr[$j+1]} ]]
		    then
		        # swap
		        temp=${arr[j]}
		        arr[$j]=${arr[$((j+1))]}  
		        arr[$((j+1))]=$temp
		    fi
		done
	done
}
a=$SECONDS
bubblesort
esec=$(( SECONDS - a ))

printf "\nArray in sorted order: \n${arr[*]}\n"
printf "\nTime taken for bubble sort\n$esec second"