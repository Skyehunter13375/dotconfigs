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
sudo printf "\n/swapfile  none  swap  sw  0  0\n" >> /etc/fstab
