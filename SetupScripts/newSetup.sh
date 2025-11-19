# 
# sudo dnf install git gh
# git config --global user.name ""
# git config --global user.email ""
# gh auth login

# RPMFusion Free Repo install
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# RPMFusion NON-FREE Repo install
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Update to read in the RPMFusion stuff
sudo dnf update -y

# Installing required packages
sudo dnf install nvim tmux kitty btop golang postgresql snapd

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Installing Obsidian
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install obsidian --classic

# Grab my nvim configs from github
git clone https://github.com/Skyehunter13375/NullSky-Nvim.git ~/.config/nvim

# Grab the rest of my .configs and put em where they need to go
mkdir ~/Projects
mkdir ~/.config/kitty

git clone https://github.com/Skyehunter13375/dotconfigs.git ~/Projects/dotconfigs

mv ~/Projects/dotconfigs/kitty.conf ~/.config/kitty/
mv ~/Projects/dotconfigs/.tmux.conf ~/
mv ~/Projects/dotconfigs/starship.toml ~/.config/

git clone https://github.com/Skyehunter13375/Spacetraders_Client.git ~/Projects/SpaceTraders

