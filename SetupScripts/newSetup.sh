# TODO:
# [ ] Add steps for building .pgpass
# [ ] Fix the broken pg_hba.conf update, permissions issue

projDir="${HOME}/Projects"
confDir="${projDir}/dotconfigs"
setuplg="${projDir}/setup.log"
fontDir="/usr/share/fonts"
ccfonts="${fontDir}/CascadiaCodeNerdFonts"


echo '┣━━━━━━━━━━━━━━━━━━┫ Installing RPMFusion (Free + Non-Free) ┣━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Installing packages ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo dnf copr enable varlad/yazi -y
sudo dnf install -y nvim tmux kitty btop golang php postgresql-server discord yazi jq


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

ln -sf ${confDir}/.config/starship.toml ~/.config/starship.toml
ls -la ~/.config/starship.toml

ln -sf ${confDir}/.tmux.conf ~/.tmux.conf
ls -la ~/.tmux.conf

ln -sf ${confDir}/.bashrc ~/.bashrc
ls -la ~/.bashrc

mkdir ~/Applications


echo '┣━━━━━━━━━━━━━━━━━━━━━━━┫ Linking root configs to mine ┣━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo mkdir /root/.config
sudo ln -sf "$HOME/.config/nvim" /root/.config/nvim
sudo ls -la /root/.config/nvim

sudo ln -sf "$HOME/.bashrc" /root/.bashrc
sudo ls -la /root/.bashrc


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━┫ Set up PostgreSQL Database ┣━━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo postgresql-setup --initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo -i -u postgres createdb spacetraders
sudo -i -u postgres createuser skyehunter -P
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE spacetraders TO skyehunter;"
sudo -i -u postgres psql -c "GRANT ALL PRIVILEGES ON SCHEMA public TO skyehunter;'

echo '
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all             all                                     md5   # "local" is for Unix domain socket connections only
host    all             all             127.0.0.1/32            md5   # IPv4 local connections:
host    all             all             ::1/128                 md5   # IPv6 local connections:
local   replication     all                                     peer  # Allow replication connections from localhost, by a user with the replication privilege.
host    replication     all             127.0.0.1/32            ident # Allow replication connections from localhost, by a user with the replication privilege.
host    replication     all             ::1/128                 ident # Allow replication connections from localhost, by a user with the replication privilege.
' > /var/lib/pgsql/data/pg_hba.conf

echo 'All done'
echo 'Go download Obsidian and stick the appimage in ~/Applications if you want'

