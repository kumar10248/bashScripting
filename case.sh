#!/bin/bash

while true; do
   

    echo "===================="
    echo "   Bash Calculator"
    echo "===================="
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Modulus"
    echo "6. Exit"
    echo "===================="

    read -p "Enter your choice (1-6): " choice
     read -p "Enter two numbers: " a b

    case $choice in
        1) echo "Result: $((a + b))" ;;
        2) echo "Result: $((a - b))" ;;
        3) echo "Result: $((a * b))" ;;
        4) 
            if [ $b -eq 0 ]; then
                echo "Error: Division by zero"
            else
                echo "Result: $((a / b))"
            fi
            ;;
        5) echo "Result: $((a % b))" ;;
        6) echo "Exiting..."; break ;;
        *) echo "Invalid choice, please enter 1-6" ;;
    esac

    echo ""  # blank line for readability
done
echo "Thank you for using the calculator!"