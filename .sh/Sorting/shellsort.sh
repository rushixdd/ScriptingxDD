#!/bin/bash

MAXCOUNT=1000
count=1
RANDOM=180

while [ "$count" -le $MAXCOUNT ]; do
 arr[$count]=$RANDOM
 let "count += 1"
done
printf "Array in original order: \n${arr[*]}\n"

shellsort(){
	for((interval="$2";interval>0;interval=interval/2))
	do
		for((i=interval;i<"$2";i++))
		do
			temp=${arr[$i]}
			for((j=i;j>=interval && arr[j-interval] > temp;j=j-interval))
			do
				arr[$j]=${arr[$j - $interval]}
			done
			arr[$j]=$temp
		done
	done
}

a=$SECONDS
shellsort arr MAXCOUNT+1
esec=$(( SECONDS - a ))

printf "\nArray in sorted order: \n${arr[*]}\n"
printf "\nTime taken for insertion sort\n$esec second"