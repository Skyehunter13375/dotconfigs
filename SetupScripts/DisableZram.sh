# Create swap file
sudo touch /swapfile

# Configure file as proper swap type
sudo chattr +C /swapfile
sudo fallocate -l 16G /swapfile
sudo chmod 600 /swapfile

# Tell the OS this is a swap file
sudo mkswap /swapfile

# Enable the swap file
sudo swapon /swapfile

# Sanity check
sudo swapon --show

# Add to fstab so that it swapons at boot
sudo bash -c "echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab"

# Creating an empty file here disables the default Fedora zram configs
sudo touch /etc/systemd/zram-generator.conf

# Swapoff the existing zram partition
sudo swapoff /dev/zram0
