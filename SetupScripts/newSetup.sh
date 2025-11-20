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
confDir="${projDir}/dotconfigs"
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
git clone https://github.com/Skyehunter13375/NullSky-Nvim.git        ${projDir}/nvim
git clone https://github.com/Skyehunter13375/Spacetraders_Client.git ${projDir}/SpaceTraders


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Creating config symlinks ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
ln -sf ${confDir}/.config/nvim          ~/.config/nvim;          ls -la ~/.config/nvim
ln -sf ${confDir}/.config/kitty         ~/.config/kitty;         ls -la ~/.config/kitty
ln -sf ${confDir}/.config/starship.toml ~/.config/starship.toml; ls -la ~/.config/starship.toml
ln -sf ${confDir}/.tmux.conf            ~/.tmux.conf;            ls -la ~/.tmux.conf
ln -sf ${confDir}/.bashrc               ~/.bashrc;               ls -la ~/.bashrc

echo '┣━━━━━━━━━━━━━━━━━━━━━━━┫ Linking root configs to mine ┣━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo mkdir /root/.config
sudo ln -sf "$HOME/.config/nvim" /root/.config/nvim; ls -la ~/root/.config/nvim
sudo ln -sf "$HOME/.bashrc"      /root/.bashrc;      ls -la ~/root/.bashrc

