#!/bin/bash

MAXCOUNT=1000
count=1
RANDOM=180

while [ "$count" -le $MAXCOUNT ]; do
 arr[$count]=$RANDOM
 let "count += 1"
done
printf "Array in original order: \n${arr[*]}\n"

merge() {
	local first=2
	local second=$(( $1 + 2 ))
	for i in ${@:2}
	do
		if [[ $first -eq $(( $1 + 2 )) ]]
		then
			echo ${@:$second:1} ; ((second += 1))
		else
			if [[ $second -eq $(( ${#@} + 1 )) ]]
			then
				echo ${@:$first:1} ; ((first += 1))
			else
				if [[ ${@:$first:1} -lt ${@:$second:1} ]]
				then
					echo ${@:$first:1} ; ((first += 1))
				else
					echo ${@:$second:1} ; ((second += 1))
				fi
			fi
		fi
	done
}

mergesort() {
	if [[ $1 -ge 2 ]]
	then
		local med=$(( $1 / 2 ))
		local first=( $(mergesort $med ${@:2:$med}) )
		local second=( $(mergesort $(( $1 - $med )) ${@:$(( $med + 2 )):$(( $1 - $med ))}) )
		echo $(merge $med ${first[@]} ${second[@]})
	else
		echo $2
	fi
}

a=$SECONDS
b=$(mergesort 1000 ${arr[@]})
esec=$(( SECONDS - a ))

printf "\nArray in sorted order: \n${b[*]}\n"
printf "\nTime taken for merge sort\n$esec second"