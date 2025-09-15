#!/bin/bash

FILE="tasks.txt"

# Load tasks from file into array
if [ -f "$FILE" ]; then
    mapfile -t tasks < "$FILE"
else
    tasks=()
fi

while true; do
    echo "=========================="
    echo "      TO-DO LIST MENU     "
    echo "=========================="
    echo "1. View Tasks"
    echo "2. Add Task"
    echo "3. Delete Task"
    echo "4. Exit"
    echo "=========================="

    read -p "Enter your choice: " choice

    case $choice in
        1)
            if [ ${#tasks[@]} -eq 0 ]; then
                echo "No tasks available."
            else
                echo "Your Tasks:"
                for i in "${!tasks[@]}"; do
                    echo "$((i+1)). ${tasks[$i]}"
                done
            fi
            ;;
        2)
            read -p "Enter new task: " new_task
            tasks+=("$new_task")
            printf "%s\n" "${tasks[@]}" > "$FILE"
            echo "Task added!"
            ;;
        3)
            if [ ${#tasks[@]} -eq 0 ]; then
                echo "No tasks to delete."
            else
                read -p "Enter task number to delete: " num
                if [ $num -le ${#tasks[@]} ] && [ $num -gt 0 ]; then
                    unset tasks[$((num-1))]
                    tasks=("${tasks[@]}")  # reindex array
                    printf "%s\n" "${tasks[@]}" > "$FILE"
                    echo "Task deleted!"
                else
                    echo "Invalid task number."
                fi
            fi
            ;;
        4)
            echo "Goodbye 👋"
            break
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done
