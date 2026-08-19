#!/bin/bash

# ========== BASH TO DO SCRIPT

# Function to check if the file "tasks.txt" exists
# Creates a new file if it does not exist
function check_for_file {
    printf "\n========== Welcome to TASKS script\n"
    printf "Checking if text file exists...\n"
    
    # Check if the file exists
    # '!' negates the condition; it means "not"
    # '-e checks to see if a file exists'
    if [ ! -e "tasks.txt" ]; then
        echo "File does not exist."
        echo "Creating text file..."
        touch tasks.txt
        
        # Check the exit status of touch immediately after it
        if [ $? -eq 0 ]; then
            printf "File created successfully.\n"
        else
            printf "Failed to create file.\n"
            exit 1  # Exit script if file cannot be created
        fi
    else
        echo "File exists."
    fi
    
    # Call the menu function
    menu
}

# Function displays main menu and gets user choice
function menu {
    printf "\n========== Main Menu\n"
    printf "Select options:\n"
    printf "1. Add task\n"
    printf "2. View tasks\n"
    printf "3. Remove task\n\n"
    
    while true; do
        printf "User choice: "
        read -r choice

        # Handle user choice
        case "$choice" in
            1) printf "You've chosen option 1: Add task.\n"
               add_task ;;
            2) printf "You've chosen option 2: View tasks.\n"
               view_task ;;
            3) printf "You've chosen option 3: Remove task.\n"
               remove_task ;;
            *) printf "Invalid choice, please try again.\n" ;;
        esac
    done
}

# Function to add a task to the tasks file
function add_task {
    printf "\n========== Add a Task\n"
    printf "Input task: "
    read -r task

    # '-z' = test operator to see if string is empty
    if [ -z "$task" ]; then
        printf "Task cannot be empty. Please enter a valid task.\n"
        return
    fi

    echo "$task" >> tasks.txt
    printf "Task added successfully.\n"
}

# Function to view tasks from the task file
function view_task {
    printf "\n========== Viewing Tasks\n"

    # Check if the tasks file exists
    if [ ! -e "tasks.txt" ]; then
        printf "No tasks found. Please add a task first.\n"
        return
    fi

    # Check if the tasks file is empty
    if [ ! -s tasks.txt ]; then
        printf "No tasks found in the file.\n"
        return
    fi

    # Display the contents of the tasks file
    cat tasks.txt
}

# Function to remove a task from the tasks file
function remove_task {
    printf "\n========== Removing Tasks\n"
    printf "Current tasks:\n"
    
    # Check if the tasks file exists
    if [ ! -e "tasks.txt" ]; then
        printf "No tasks found. Please add a task first.\n"
        return
    fi

    # Display current tasks
    cat tasks.txt
    printf "Input task to remove: "
    read -r remove

    # Check if input is empty
    if [ -z "$remove" ]; then
        printf "You must specify a task to remove.\n"
        return
    fi

    # Remove the task and update the tasks file
    if grep -q "$remove" tasks.txt; then
        grep -v "$remove" tasks.txt > temp.txt && mv temp.txt tasks.txt
        printf "Task removed successfully.\n"
    else
        printf "Task not found.\n"
    fi
}

# Main function to start the script
check_for_file
