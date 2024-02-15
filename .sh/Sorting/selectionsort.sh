#!/bin/bash

MAXCOUNT=1000
count=1
RANDOM=180

while [ "$count" -le $MAXCOUNT ]; do
 arr[$count]=$RANDOM
 let "count += 1"
done
printf "Array in original order: \n${arr[*]}\n" 

# Performing Selection sort
selectionsort(){
	for((i=0;i<MAXCOUNT;i++))
	do
		small=${arr[$i]}
		index=$i
		for((j=i+1;j<=MAXCOUNT;j++))
		do
			if((arr[j]<small))
			then
				small=${arr[$j]}
				index=$j
			fi
		done
		temp=${arr[$i]}
		arr[$i]=${arr[$index]}
		arr[$index]=$temp
	done
}

a=$SECONDS
selectionsort
esec=$(( SECONDS - a ))

printf "\nArray in sorted order: \n${arr[*]}\n"
printf "\nTime taken for selection sort\n$esec second"