#!/bin/bash

# Print the header for the vehicle database
printf "\n===== Vehicles Database\n\n"

# Function to list vehicles
function vehicle {
    # Initialize a counter variable for vehicle numbering
    local num=0
    
    # Declare an array of vehicle names
    local vehicles=("Audi" "BMW" "Mercedes" "Jeep" "Range Rover" "Mercedes" "Bentley")
    
    # Loop through each vehicle in the array
    for vehicle in "${vehicles[@]}"; do
        # Increment the counter for each vehicle
        num=$((num+1))
        
        # Print the vehicle number and name
        printf "Vehicle %d: %s\n" "$num" "$vehicle"
    done
    printf "\n"
}

# Call the vehicle function to execute the vehicle listing
vehicle

# ========== NOTES

# printf format specifiers
# %d = whole numbers
# %s = string
# %f = float

# @ = all elements of an array/list
# (()) = used for arithmetic expressions 
