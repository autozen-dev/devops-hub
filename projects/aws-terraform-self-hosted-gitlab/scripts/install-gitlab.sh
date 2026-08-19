#!/bin/bash
set -euxo pipefail

exec > >(tee -a /var/log/install-gitlab.log) 2>&1

# Update Ubuntu packages
apt-get update -y
apt-get upgrade -y

# Install Docker from Ubuntu's supported package repository
apt-get install -y \
		ca-certificates \
		curl \
		docker.io
systemctl enable docker
systemctl start docker


# Wait for EBS volume to be attached
data_device=""
for attempt in $(seq 1 150); do
	udevadm settle || true
	data_device=$(lsblk -brndo NAME,SIZE,TYPE | awk '$2 == 107374182400 && $3 == "disk" { print "/dev/" $1; exit }')
	if [ -n "$data_device" ]; then
		break
	fi
	sleep 2
done

if [ -z "$data_device" ]; then
	echo "Unable to find the 100 GiB GitLab data volume" >&2
	exit 1
fi

# Format if new (only if not restoring from snapshot)
if ! blkid "$data_device"; then
	mkfs.ext4 "$data_device"
fi

mkdir -p /mnt/gitlab-data
data_uuid=$(blkid -s UUID -o value "$data_device")
mount "$data_device" /mnt/gitlab-data
grep -q "UUID=$data_uuid" /etc/fstab || echo "UUID=$data_uuid /mnt/gitlab-data ext4 defaults,nofail 0 2" >> /etc/fstab

# Remove any existing GitLab container (idempotent)
docker rm -f gitlab || true

# Prepare GitLab data directories
mkdir -p /mnt/gitlab-data/gitlab/config
mkdir -p /mnt/gitlab-data/gitlab/logs
mkdir -p /mnt/gitlab-data/gitlab/data

# Run GitLab CE in Docker
docker run --detach \
	--hostname gitlab.internal.company \
	--publish 80:80 --publish 443:443 \
	--name gitlab \
	--restart always \
	--volume /mnt/gitlab-data/gitlab/config:/etc/gitlab \
	--volume /mnt/gitlab-data/gitlab/logs:/var/log/gitlab \
	--volume /mnt/gitlab-data/gitlab/data:/var/opt/gitlab \
	gitlab/gitlab-ce:latest

# Wait for GitLab to be ready
until curl -s http://localhost/users/sign_in; do sleep 10; done


# Automate sign-up restriction (first boot only)
if [ ! -f /mnt/gitlab-data/gitlab/initialized ]; then
	docker exec gitlab gitlab-rails runner "ApplicationSetting.current.update(signup_enabled: false, require_admin_approval_after_user_signup: false)"
	touch /mnt/gitlab-data/gitlab/initialized
fi

# Print access info
echo "GitLab is being installed. Access it internally via http://<instance-private-ip> or http://gitlab.internal.company"