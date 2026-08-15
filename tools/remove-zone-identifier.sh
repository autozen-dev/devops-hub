#!/bin/bash

# This script removes Windows "Zone.Identifier" files.
# These files are usually created by Windows when you download a file
# from the internet. They are not needed for normal use and can be safely removed.

# Define a function so the script is easier to read and reuse.
delete() {
    # Ask the user for the folder they want to clean.
    read -r -p "Enter the path: " SOURCEPATH

    # Make sure the path exists and is actually a directory.
    # If not, show an error and stop the script.
    if [ ! -d "$SOURCEPATH" ]; then
        echo "Path does not exist!"
        exit 1
    fi

    # Search the folder for all files whose names end with ":Zone.Identifier".
    # -print0 is used so file names with spaces are handled safely.
    mapfile -d '' files < <(find "$SOURCEPATH" -type f -name "*:Zone.Identifier" -print0)

    # If no matching files are found, tell the user and exit cleanly.
    if [ ${#files[@]} -eq 0 ]; then
        echo "No Zone.Identifier files found in: $SOURCEPATH"
        return 0
    fi

    # Show the user which files will be removed.
    echo "Found ${#files[@]} file(s) to delete:"
    for file in "${files[@]}"; do
        echo " - $file"
    done

    # Ask for confirmation before deleting anything.
    read -r -p "Delete these files? [y/N]: " answer

    # Only continue if the user types yes.
    case "$answer" in
        [yY]|[yY][eE][sS])
            # Delete each file and count how many were removed.
            deleted=0
            for file in "${files[@]}"; do
                rm -f -- "$file"
                echo "Deleted file: $file"
                deleted=$((deleted + 1))
            done

            # Tell the user how many files were removed.
            echo "Removed $deleted file(s)."
            ;;
        *)
            # If the answer is anything else, cancel the operation.
            echo "Cancelled. No files were deleted."
            ;;
    esac
}

# Call the function when the script starts.
delete
