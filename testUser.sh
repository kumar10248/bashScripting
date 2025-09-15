#!/bin/bash

echo "Welcome! Add user details. Type 'exit' as name to quit."

while true; do
    read -p "Enter name and age: " name age
    
    # Exit condition
    if [[ "$name" == "exit" ]]; then
        echo "Exiting..."
        break
    fi

    # Check if age is a number
    if ! [[ "$age" =~ ^[0-9]+$ ]]; then
        echo "Invalid age! Please enter a number."
        continue
    fi

    # Append to file
    echo "name: $name  ; age: $age" >> test.txt
    echo "User $name added successfully."
done

# Display all users
echo -e "\nAll users in test.txt:"
cat test.txt
