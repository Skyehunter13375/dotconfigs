# Start from current build
sudo dnf update -y

# RPMFusion Free Repo install
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# RPMFusion NON-FREE Repo install
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update to read in the RPMFusion stuff
sudo dnf update -y

# Installing required packages
sudo dnf install git gh nvim tmux kitty btop golang postgresql 

# Set my git configs
echo "Open a new terminal and set your git configs"
echo "git config --global user.name"
echo "git config --global user.email"
echo "Press any key to continue ..........."
read

# Link this machine to my github
gh auth login

# Install starship
curl -sS https://starship.rs/install.sh | sh
