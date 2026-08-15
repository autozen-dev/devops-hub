# Daily DevOps Bash Commands

This file contains the commands that are most useful in real day-to-day DevOps work. These are practical, commonly used, and easy to understand when you are managing servers, deployments, logs, containers, or Kubernetes.

| Command | What it does | Example | Typical use |
|---------|--------------|---------|-------------|
| `ls` | Lists files and folders in the current directory. | `ls -la` | Check what is inside a directory. |
| `cd` | Changes the current working directory. | `cd /var/log` | Move into a directory you need to inspect. |
| `pwd` | Prints the current working directory. | `pwd` | Confirm where you are before running commands. |
| `grep` | Searches for text inside files. | `grep -R "error" /var/log` | Find errors in logs or config files. |
| `find` | Finds files or directories by name or type. | `find /etc -name "*.conf"` | Locate configuration files. |
| `tail` | Shows the last lines of a file. | `tail -f /var/log/syslog` | Follow a log in real time. |
| `head` | Shows the first lines of a file. | `head -n 20 app.log` | Preview the beginning of a log or file. |
| `ps` | Displays running processes. | `ps aux | grep nginx` | Check if a service is running. |
| `top` | Shows live system usage for CPU, memory, and processes. | `top` | Monitor performance in real time. |
| `ssh` | Connects securely to a remote machine. | `ssh user@server.example.com` | Manage servers remotely. |
| `scp` | Copies files securely between machines. | `scp app.tar.gz user@server:/tmp/` | Transfer files to a server. |
| `curl` | Sends HTTP requests to a URL. | `curl -I https://example.com` | Check if a service is reachable. |
| `wget` | Downloads a file from a URL. | `wget https://example.com/file.tar.gz` | Download artifacts or packages. |
| `tar` | Archives and compresses files. | `tar -czf app.tar.gz app/` | Package application files for backup or transfer. |
| `chmod` | Changes file permissions. | `chmod 755 script.sh` | Make a script executable. |
| `chown` | Changes file ownership. | `chown deploy:deploy /opt/app` | Fix ownership for application files. |
| `df` | Shows disk space usage. | `df -h` | Check if a server is running out of disk space. |
| `du` | Shows directory size usage. | `du -sh /var/log` | Find large folders consuming disk space. |
| `free` | Shows available memory and swap usage. | `free -h` | Check RAM usage. |
| `systemctl` | Manages Linux system services. | `systemctl status nginx` | Start, stop, restart, or check service health. |
| `journalctl` | Reads logs from the systemd journal. | `journalctl -u nginx -f` | Debug a service or application issue. |
| `docker` | Manages containers and images. | `docker ps -a` | Check running or stopped containers. |
| `kubectl` | Manages Kubernetes clusters and workloads. | `kubectl get pods -A` | Inspect cluster state and deployments. |
| `git` | Handles source control and version history. | `git pull origin main` | Update code from a remote repository. |
| `sed` | Filters and transforms text in files. | `sed -n '1,20p' app.log` | Show selected lines from a file. |
| `awk` | Processes text and extracts fields. | `awk '{print $1}' access.log` | Extract values from logs or structured files. |

## Quick tips

- Use `tail -f` when you want to watch a log live.
- Use `grep` to quickly search for errors, keywords, or config values.
- Use `systemctl` and `journalctl` for Linux service troubleshooting.
- Use `docker` and `kubectl` when working with containers and Kubernetes.
- Use `curl` to verify that an endpoint or service is responding.

This list is intentionally focused on commands that are useful in real production and operations work, not every possible Bash feature.

## More commands
- date: displays date
- date -I displays date in yyyy-mm-dd format