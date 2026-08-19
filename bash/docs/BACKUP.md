# Backup Notes

## Backup Script

- Script: `projects/backup-advanced.sh`
- Source: `/home/arsalan/repositories/personal-projects/devops-repo/bash`
- Destination: `/home/arsalan/repositories/personal-projects/devops-repo/backup`
- Format: `.tar.gz`
- File name pattern: `bash_backup_YYYY-MM-DD_HH-MM-SS.tar.gz`

## Command Used

```bash
tar -czf "$BACKUP_PATH" -C "$SOURCEDIR" .
```

### What the flags mean

- `-c`: create a new archive
- `-z`: compress the archive with gzip
- `-f`: use the next argument as the output file name
- `-C`: change directory before archiving
- `.`: include the contents of the current source directory

## Script Behaviour

- Validates that the source directory exists.
- Creates the backup directory if it does not exist.
- Checks that the destination directory is writable.
- Creates a timestamped archive name so older backups are not overwritten.
- Prints the source directory and archive path to the terminal.
- Verifies that the backup file exists before reporting success.

## Terminal Output Example

```bash
Backup script initiating...
Backup created from: /home/arsalan/repositories/personal-projects/devops-repo/bash
Backup created successfully at: /home/arsalan/repositories/personal-projects/devops-repo/backup/bash_backup_2026-08-15_16-30-28.tar.gz
Backup verification passed. Archive exists.
```

## Purpose

This script creates a compressed backup of the `bash` folder so the project can be archived safely and restored later if needed.

## Important Rules

- Use `tar -czf` for a gzip-compressed backup on Linux.
- Keep the backup directory outside the source directory.
- Use timestamps in the file name so each backup remains unique.
- Print both the source and archive path so recovery is easier.
- Always verify that the archive was created successfully.
