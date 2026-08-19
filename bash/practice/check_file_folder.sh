#!/bin/bash

# Function to check if a specific file exists
function file_exists {
    # Print a message indicating the check is starting
    printf "\nChecking if file exists...\n"
    
    # Check if 'project_one.sh' exists as a regular file
    if [ -f "project_one.sh" ]; then
        # Print message if the file exists
        printf "File exists.\n"
    else
        # Print message if the file does not exist
        printf "File does not exist.\n"
    fi
}

# Function to check if a specific folder exists
function folder_exists {
    # Print a message indicating the check is starting
    printf "\nChecking if folder exists...\n"
    
    # Check if '/random_folder/' exists as a directory
    if [ -d "/random_folder/" ]; then
        # Print message if the folder exists
        printf "Folder exists.\n"
    else
        # Print message if the folder does not exist
        printf "Folder does not exist.\n"
    fi  # Closing the if statement
}

# Call the functions to execute the checks
file_exists
folder_exists

# -f: Checks if the specified path is a regular file
# -d: Checks if the specified path is a directory
# [ ... ]: Test command used for evaluating expressions; also known as 'test'.

