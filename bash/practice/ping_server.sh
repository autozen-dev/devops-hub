#!/bin/bash

# ping server
function ping_to_server {
    printf "\n"
    # ping uses domain names or IP addresses, not URLs
    ping -c 1 www.google.com
    if [ $? -eq 0 ]; then
      printf "\nSuccessfully pinged to server.\n\n"
    else
      printf "\nUnable to ping to server.\n\n"
    fi
}

ping_to_server

# '[ $? -eq 0 ]' checks if the last executed command's exit status is 0.
# If the exit status is 0, it means the command was successful.
# $? is a special variable that holds the exit status of the last executed command.
# '-eq 0' checks if the exit status is equal to 0, indicating success.
