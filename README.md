# Why does this exist?
I wanted a standardized setup script for brand new RHEL based systems so I can speed up setup times for new installs.

# Pre-setup Setup Steps
- sudo dnf install git gh
- git config --global user.name ""
- git config --global user.email ""
- gh auth login
- mkdir ~/Projects
- git clone https://github.com/Skyehunter13375/dotconfigs.git ~/Projects/dotconfigs
- ~/Projects/dotconfigs/SetupScripts/newSetup.sh

# Milestones
- Updates & Installs
    - [x] Package Management
        - [x] RPMFusion
    - [ ] Desktop Environment
        - [x] Hyprland
        - [x] Hyprpaper
        - [ ] Hyprshot
        - [x] Waybar 
    - [x] Editors & Terminal Tools
        - [x] NeoVim
        - [x] Tmux
        - [x] Kitty
        - [x] Btop
        - [x] Yazi
        - [x] Starship
        - [x] CaskaydiaCove Nerd Font
    - [x] Programming & Databases
        - [x] Golang
        - [x] PHP
        - [x] PostgreSQL Server
    - [x] Comms
        - [x] Discord
    - [ ] Browsers
        - [ ] Brave
        - [ ] Google Chrome (Not sure if I really want this)

- Removes default Fedora bloat
    - [x] Thunderbird
    - [x] Pidgin
    - [x] Xfburn
    - [x] Hexchat
    - [x] Transmission
    - [x] Rhythmbox

- Setup Steps Automated
    - [x] Starship
    - [x] Symlinks for root user
    - [x] Symlinks for .config
    - [x] Initialize Postgres DB
        - [x] Table creation delegated to my Spacetraders setup repo
