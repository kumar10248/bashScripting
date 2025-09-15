#!/bin/bash

# arr=(8 2 5 1 4)
# echo "Array Elements: ${#arr[*]}"
# echo "Array Elements: ${arr[@]}"
# echo "Array Elements: ${arr[0]}"
# echo "Array Elements: ${arr[1]}"
# echo "Array Elements: ${arr[2]}"
# echo "Array Elements: ${arr[3]}"
# echo "Array Elements: ${arr[4]}"    
# echo "Array Elements: ${arr[5]}"  # empty
# echo "Array Elements: ${arr[-1]}" # last element
# echo "Array Elements: ${arr[-2]}" # second last element 
# echo "Array Elements: ${arr[-3]}" # third last element
# echo "Array Elements: ${arr[-4]}" # fourth last element
# echo "Array Elements: ${arr[-5]}" # fifth last element
# echo "Array Elements: ${arr[-6]}" # empty
# echo "Array Elements: ${arr[@]:0:3}" # first three elements
# echo "Array Elements: ${arr[@]:2:3}" # three elements from index

# arr[1]=10
# echo "Array Elements after modification: ${arr[@]}"

# unset arr[3]
# echo "Array Elements after deletion: ${arr[@]}"

# for i in "${arr[@]}"; do
#     echo "Array Element: $i"
# done



# Simulated 2D array
# students[0,0]="Devashish"
# students[0,1]=22
# students[1,0]="Harsha"
# students[1,1]=21
# students[2,0]="Saniya"
# students[2,1]=22

# # Access
# echo "Name: ${students[0,0]}, Age: ${students[0,1]}"
# echo "Name: ${students[1,0]}, Age: ${students[1,1]}"
# echo "Name: ${students[2,0]}, Age: ${students[2,1]}"


declare -A students

students["Devashish"]=22
students["Harsha"]=21
students["Saniya"]=22

for name in "${!students[@]}"; do
    echo "Name: $name , Age: ${students[$name]}"
done



names=("Devashish" "Harsha" "Saniya")
ages=(22 21 22)

for i in "${!names[@]}"; do
    echo "Name: ${names[$i]}, Age: ${ages[$i]}"
done

# Declare array
arr=("one" "two" "three")

# Access element
echo ${arr[1]}        # two

# All elements
echo ${arr[@]}        # one two three

# All indexes
echo ${!arr[@]}       # 0 1 2

# Length of array
echo ${#arr[@]}       # 3

# Add element
arr+=("four")

# Update element
arr[1]="TWO"

# Delete element
unset arr[2]

# Loop with values
for val in "${arr[@]}"; do
   echo $val
done

# Loop with indexes
for i in "${!arr[@]}"; do
   echo "Index $i = ${arr[$i]}"
done
