#!/bin/bash

# Production-style backup script for a DevOps environment.
# This script creates a timestamped compressed archive of the bash folder
# and stores it in a dedicated backup directory.

# Treat unset variables as errors to fail fast and prevent silent issues.
set -u

# Source directory to back up.
SOURCEDIR="/home/arsalan/repositories/personal-projects/devops-repo/bash"

# Directory where backups will be stored.
DESTDIR="/home/arsalan/repositories/personal-projects/devops-repo/backup"

# Create a readable, sortable backup filename.
# Example: bash_backup_2026-08-15_16-23-10.tar.gz
BACKUP_NAME="bash_backup_$(date +%Y-%m-%d)_$(date +%H-%M-%S).tar.gz"
BACKUP_PATH="$DESTDIR/$BACKUP_NAME"

# Validate that the source directory exists.
# -d in the command below checks if "$SOURCEDIR" is a directory
#  if it's not a directory, then echo error message and exit terminal
if [[ ! -d "$SOURCEDIR" ]]; then
    echo "Error: source directory does not exist: $SOURCEDIR" >&2
    exit 1
fi

# Create the backup directory if it does not already exist.
mkdir -p "$DESTDIR"

# Confirm the destination is writable.
if [[ ! -w "$DESTDIR" ]]; then
    echo "Error: destination directory is not writable: $DESTDIR" >&2
    exit 1
fi

# Start the backup process.
printf "Backup script initiating...\n"

# Use tar to archive the bash directory contents.
# -c = create archive
# -z = gzip compression
# -f = output file name
# -C = change into the source directory before archiving
# . = include the current directory contents
if tar -czf "$BACKUP_PATH" -C "$SOURCEDIR" .; then
    printf "Backup created from: %s\n" "$SOURCEDIR"
    printf "Backup created successfully at: %s\n" "$BACKUP_PATH"
else
    echo "Error: backup creation failed." >&2
    exit 1
fi

# Optional: verify the archive exists before finishing.
if [[ -f "$BACKUP_PATH" ]]; then
    printf "Backup verification passed. Archive exists.\n"
else
    echo "Error: backup archive was not created." >&2
    exit 1
fi