#!/bin/bash

# Print the script header
printf "\n===== Environment Setup Script =====\n\n"

# Function to check Git status
function git_status {
    printf "Checking Git...\n"
    # Check if Git is installed by looking for its command in the system
    if command -v git &> /dev/null; then
        printf "Git exists.\n"
        # Print the installed Git version
        printf "Git version: %s\n\n" "$(git --version)"
    else
        printf "Git does not exist.\nInstalling Git...\n"
        # Update the package manager and install Git if it is not installed
        sudo apt update && sudo apt install -y git
        printf "Git installed successfully.\n"
    fi
}

# Function to check Docker status
function docker_status {
    printf "Checking Docker...\n"
    # Check if Docker is installed by looking for its command in the system
    # '&> /dev/null; discards output and errors, not displaying them on the console
    if command -v docker &> /dev/null; then
        printf "Docker exists.\n"
        # Print the installed Docker version
        printf "Docker version: %s\n\n" "$(docker --version)"
    else
        printf "Docker does not exist.\nInstalling Docker...\n"
        # Update the package manager and install Docker if it is not installed
        sudo apt update
        sudo apt install -y docker.io
        printf "Docker installed successfully.\n"
        # Print the installed Docker version
        printf "Docker version: %s\n\n" "$(docker --version)"
    fi
}

# Call the functions to check the status of Git and Docker
git_status
docker_status
