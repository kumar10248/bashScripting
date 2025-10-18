#!/bin/bash
for((i=0;i <10;i++)){
    echo "Devashish"
}

arr=(1 2 6 8)
echo ${!arr[@]}

for i in ${!arr[@]}; do
    echo "Array Element: ${arr[$i]}"
done

echo ${#arr[@]}
# while loop

# j=0;
# while [ $j -lt 4 ]; do
# echo "deva"
# let j++
# done 

# i=0;

# until [ $i -gt 10 ];
# do

# echo "devo";
# let i++;

# done;


