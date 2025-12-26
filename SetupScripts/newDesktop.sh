# TODO:
# [ ] Double check steps and links for hyprland configs
# [x] Fix the broken pg_hba.conf update, permissions issue
# [x] Fix the broken postgresql-server install. It doesn't create perms correctly
# [x] Add steps to remove preinstalled bloat in Fedora

echo '┣━━━━━━━━━━━━━━━━━━┫ Installing RPMFusion (Free + Non-Free) ┣━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr enable varlad/yazi -y
sudo dnf copr enable solopasha/hyprland
sudo dnf update -y


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Installing packages ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'
sudo dnf install -y bat nvim kitty btop golang php sqlite discord yazi hyprland hyprpaper thunar fuse-libs
sudo dnf remove hexchat thunderbird xfburn transmission rhythmbox


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Installing Starship ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫'
curl -sS https://starship.rs/install.sh | sh


echo '┣━━━━━━━━━━━━━━━━━━━━┫ Installing CascadiaCode Nerd Fonts ┣━━━━━━━━━━━━━━━━━━━━┫'
CCVersion=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | jq -r '.tag_name')
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$CCVersion"
sudo mkdir -p "/usr/share/fonts/CascadiaCodeNerdFonts"
sudo wget -P "/usr/share/fonts/CascadiaCodeNerdFonts" "$URL/CascadiaCode.zip"
sudo wget -P "/usr/share/fonts/CascadiaCodeNerdFonts" "$URL/CascadiaMono.zip"
sudo unzip   "/usr/share/fonts/CascadiaCodeNerdFonts/CascadiaCode.zip" -d "/usr/share/fonts/CascadiaCodeNerdFonts"
sudo unzip   "/usr/share/fonts/CascadiaCodeNerdFonts/CascadiaMono.zip" -d "/usr/share/fonts/CascadiaCodeNerdFonts"
sudo fc-cache -f


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Grabbing my github repos ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
git clone https://github.com/Skyehunter13375/Spacetraders_Client.git ~/Projects/SpaceTraders


echo '┣━━━━━━━━━━━━━━━━━━━━━━━━━┫ Creating config symlinks ┣━━━━━━━━━━━━━━━━━━━━━━━━━┫'
ln -sf ~/Projects/dotconfigs/.config/bat ~/.config/bat
ls -la ~/.config/bat

ln -sf ~/Projects/dotconfigs/.config/nvim ~/.config/nvim
ls -la ~/.config/nvim

ln -sf ~/Projects/dotconfigs/.config/kitty ~/.config/kitty
ls -la ~/.config/kitty

ln -sf ~/Projects/dotconfigs/.config/hypr ~/.config/hypr
ls -la ~/.config/hypr

ln -sf ~/Projects/dotconfigs/.config/wofi ~/.config/wofi
ls -la ~/.config/wofi

ln -sf ~/Projects/dotconfigs/.config/waybar ~/.config/waybar
ls -la ~/.config/waybar

ln -sf ~/Projects/dotconfigs/.config/yazi ~/.config/yazi
ls -la ~/.config/yazi

ln -sf ~/Projects/dotconfigs/.config/starship.toml ~/.config/starship.toml
ls -la ~/.config/starship.toml

ln -sf ~/Projects/dotconfigs/.tmux.conf ~/.tmux.conf
ls -la ~/.tmux.conf

ln -sf ~/Projects/dotconfigs/.bashrc ~/.bashrc
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
echo 'You can download the Obsidian.appimage and stick it in ~/Applications if you'd like'

