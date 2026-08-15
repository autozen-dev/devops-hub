
backup() {
    printf "Backup script initiating...\n"

    # name backup file with timestamp to avoid overwriting previous backups
    file_name="bash_backup_$(date +%Y-%m-%d)_$(date +%H-%M-%S).tar.gz"

    #  source directory is the bash folder in the repository, and destination directory is the backup folder with the timestamped file name
    SOURCEDIR=/home/arsalan/repositories/personal-projects/devops-repo/bash/
    
    #  destination directory is the backup folder with the timestamped file name
    DESTDIR=/home/arsalan/repositories/personal-projects/devops-repo/backup/
    
    #  create the backup directory if it doesn't exist
    mkdir -p "$DESTDIR"
    tar -czf "$DESTDIR/$file_name" -C "$SOURCEDIR" .
    printf "Backup completed successfully.\n"
}

backup