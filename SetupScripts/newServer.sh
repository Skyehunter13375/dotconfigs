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
sudo dnf install -y nvim kitty btop golang php yazi fuse-libs sqlite


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

echo '┣━━━━━━━━━━━━━━━━━━━━━━━━┫ Set up PostgreSQL Database ┣━━━━━━━━━━━━━━━━━━━━━━━━┫'
# INFO: Not required any longer - switched to SQLite for all projects
# sudo postgresql-setup --initdb
# sudo systemctl start postgresql
# sudo systemctl enable postgresql
# sudo -i -u postgres createdb spacetraders
# sudo -i -u postgres createuser skyehunter -P
# sudo -i -u postgres psql -d spacetraders -c "GRANT ALL PRIVILEGES ON DATABASE spacetraders TO skyehunter;"
# sudo -i -u postgres psql -d spacetraders -c "GRANT ALL PRIVILEGES ON DATABASE spacetraders TO skyehunter;"
# sudo -i -u postgres psql -d spacetraders -c "GRANT ALL PRIVILEGES ON SCHEMA public TO skyehunter;"
# sudo cp -f ~/Projects/dotconfigs/SetupScripts/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
# sudo chown postgresql:postgresql /var/lib/pgsql/data/pg_hba.conf
# sudo chmod 600 /var/libpgsql-data/pg_hba.conf
# sudo sysemctl restart postgresql

echo 'All done'
echo 'You can download the Obsidian.appimage and stick it in ~/Applications if you'd like'

