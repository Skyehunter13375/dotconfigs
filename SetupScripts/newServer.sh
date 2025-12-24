#!/bin/bash

projDir="${HOME}/Projects"
confDir="${projDir}/dotconfigs"
setuplg="${projDir}/setup.log"
fontDir="/usr/share/fonts"
ccfonts="${fontDir}/CascadiaCodeNerdFonts"


echo '┣━━━━━━━━━━━━━━━━━━┫ Installing RPMFusion (Free + Non-Free) ┣━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable varlad/yazi -y
sudo dnf update -y


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Installing packages ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y bat nvim kitty btop golang php yazi fuse-libs sqlite


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Installing Starship ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'
curl -sS https://starship.rs/install.sh | sh


echo '┣━━━━━━━━━━━━━━━━━━━━┫ Installing CascadiaCode Nerd Fonts ┣━━━━━━━━━━━━━━━━━━━━┫'
sudo mkdir -p "${ccfonts}"
CCVersion=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r '.tag_name')
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$CCVersion"
sudo wget -P "${ccfonts}" "$URL/CascadiaCode.zip"
sudo wget -P "${ccfonts}" "$URL/CascadiaMono.zip"
sudo unzip "${ccfonts}/CascadiaCode.zip" -d "${ccfonts}"
sudo unzip "${ccfonts}/CascadiaMono.zip" -d "${ccfonts}"
sudo fc-cache -f


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Grabbing my github repos ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
git clone https://github.com/Skyehunter13375/Spacetraders_Client.git ${projDir}/SpaceTraders


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Creating config symlinks ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
ln -sf ${confDir}/.config/bat ~/.config/bat
ls -la ~/.config/bat

ln -sf ${confDir}/.config/nvim ~/.config/nvim
ls -la ~/.config/nvim

ln -sf ${confDir}/.config/kitty ~/.config/kitty
ls -la ~/.config/kitty

ln -sf ${confDir}/.config/yazi ~/.config/yazi
ls -la ~/.config/yazi

ln -sf ${confDir}/.config/starship.toml ~/.config/starship.toml
ls -la ~/.config/starship.toml

ln -sf ${confDir}/.bashrc ~/.bashrc
ls -la ~/.bashrc


mkdir ~/Applications


echo '┣━━━━━━━━━━━━━━━━━━━━━━━┫ Linking root configs to mine ┣━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo mkdir /root/.config
sudo ln -sf "$HOME/.config/nvim" /root/.config/nvim
sudo ls -la /root/.config/nvim

sudo ln -sf "$HOME/.bashrc" /root/.bashrc
sudo ls -la /root/.bashrc

sudo ln -sf "$HOME/.config/starship.toml" /root/.config/starship.toml
sudo ls -la /root/.config/starship.toml

echo 'All done'
echo 'You can download the Obsidian.appimage and stick it in ~/Applications if you want'



# FEAT: For FoundryVTT
# Note that Foundry REQUIRES node.js v20 and is not compatible with 22 yet.
# Need to enable port 30000 through the firewall
# FedoraServer uses a custom zone name instead of "public" which is the default

# INFO: Poke holes in the local firewall
# ❯ sudo firewall-cmd --zone=FedoraServer --add-port=30000/tcp
# success
# ❯ sudo firewall-cmd --zone=FedoraServer --add-port=30000/tcp --permanent
# success

# INFO: Start the server
# node main.js --dataPath=$HOME/foundrydata/

# INFO: Create systemctl service file: /etc/systemd/system/foundryvtt.service
# [Unit]
# Description=Foundry Virtual Tabletop
# After=network.target
# 
# [Service]
# Type=simple
# User=skyehunter
# Group=skyehunter
# WorkingDirectory=/home/skyehunter/foundryvtt
# ExecStart=/usr/bin/node main.js --dataPath=/home/skyehunter/foundrydata
# Restart=always
# RestartSec=10
# Environment=NODE_ENV=production
# 
# # Hardening (safe defaults)
# NoNewPrivileges=true
# PrivateTmp=true
# ProtectSystem=full
# ProtectHome=false
# 
# [Install]
# WantedBy=multi-user.target

# INFO: Reload daemon list
# ❯ sudo systemctl daemon-reexec
# ❯ sudo systemctl daemon-reload

# INFO: Enable
# ❯ sudo systemctl enable --now foundryvtt
# Created symlink '/etc/systemd/system/multi-user.target.wants/foundryvtt.service' → '/etc/systemd/system/foundryvtt.service'.

# INFO: Start the service
# skyehunter in [ Paladin ] [ ~/foundryvtt ]
# ❯ sudo systemctl start foundryvtt


# FEAT: 5etools setup
# git clone https://github.com/5etools-mirror-3/5etools-src.git /var/www/html/5etools
# git clone https://github.com/5etools-mirror-3/5etools-img.git /var/www/html/5etools/img
