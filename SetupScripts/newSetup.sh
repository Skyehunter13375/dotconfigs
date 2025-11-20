# ################################## #
# DO THIS BEFORE RUNNING THIS SCRIPT #
# ################################## #
# sudo dnf install git gh
# git config --global user.name ""
# git config --global user.email ""
# gh auth login
# mkdir ~/Projects
# git clone https://github.com/Skyehunter13375/dotconfigs.git ~/Projects/dotconfigs
# ~/Projects/dotconfigs/SetupScripts/newSetup.sh


projDir="${HOME}/Projects"
cnfgDir="${projDir}/dotconfigs" 
nvimDir="${projDir}/nvim"
setuplg="${projDir}/setup.log"


echo '┣━━━━━━━━━━━━━━━━━━┫ Installing RPMFusion (Free + Non-Free) ┣━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Installing packages ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y snapd nvim tmux kitty btop golang php postgresql discord

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Set up snapd and install Obsidian
sudo ln -sf /var/lib/snapd/snap /snap
sudo snap install obsidian --classic


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Grabbing my github repos ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
git clone https://github.com/Skyehunter13375/NullSky-Nvim.git ${projDir}/nvim
git clone https://github.com/Skyehunter13375/Spacetraders_Client.git ${projDir}/SpaceTraders


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Creating config symlinks ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
ln -sf ${projDir}/nvim          ~/.config/nvim
ln -sf ${cnfgDir}/kitty         ~/.config/kitty
ln -sf ${cnfgDir}/starship.toml ~/.config/starship.toml
ln -sf ${cnfgDir}/.tmux.conf    ~/.tmux.conf
ln -sf ${cnfgDir}/.bashrc       ~/.bashrc

echo '┣━━━━━━━━━━━━━━━━━━━━━━━┫ Linking root configs to mine ┣━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo ln -sf "$HOME/.config/nvim" /root/.config/nvim
sudo ln -sf "$HOME/.bashrc"      /root/.bashrc

