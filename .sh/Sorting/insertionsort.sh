#!/bin/bash

MAXCOUNT=1000
count=1
RANDOM=180

while [ "$count" -le $MAXCOUNT ]; do
 arr[$count]=$RANDOM
 let "count += 1"
done
printf "Array in original order: \n${arr[*]}\n" 

# Performing Insertion sort 
insertionsort(){
	for((i=1;i<MAXCOUNT;i++))
	do
		j=$i-1
		temp=${arr[$i]}
		while((j>=0 && arr[j]>temp))
		do
			arr[$j+1]=${arr[$j]}
			j=$j-1
		done
		arr[j+1]=$temp
	done
}

a=$SECONDS
insertionsort
esec=$(( SECONDS - a ))

printf "\nArray in sorted order: \n${arr[*]}\n"
printf "\nTime taken for insertion sort\n$esec second"