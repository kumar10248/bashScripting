#!/bin/bash

FILE="tasks.txt"

if [ -f "$FILE" ]; then
    mapfile -t tasks < "$FILE"
else
    tasks=()
fi

save_tasks() {
    printf "%s\n" "${tasks[@]}" > "$FILE"
}

while true; do
    echo "=========================="
    echo "      TO-DO LIST MENU     "
    echo "=========================="
    echo "1. View Tasks"
    echo "2. Add Task"
    echo "3. Mark Task as Done"
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
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            task_with_time="$new_task (added on $timestamp) [PENDING]"
            tasks+=("$task_with_time")
            save_tasks
            echo "Task added!"
            ;;
        3)
            if [ ${#tasks[@]} -eq 0 ]; then
                echo "No tasks to mark."
            else
                read -p "Enter task number to mark as DONE: " num
                if [ $num -le ${#tasks[@]} ] && [ $num -gt 0 ]; then
                    tasks[$((num-1))]="${tasks[$((num-1))]/\[PENDING\]/[DONE ✅]}"
                    save_tasks
                    echo "Task marked as DONE!"
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
