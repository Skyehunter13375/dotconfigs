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
- [x] Updates & Installs
    - [x] RPMFusion
    - [x] NeoVim
    - [x] Tmux
    - [x] Kitty
    - [x] Btop
    - [x] Golang
    - [x] PHP
    - [x] PostgreSQL Server
    - [x] Discord
    - [x] Yazi
    - [x] Starship
    - [x] CaskaydiaCove Nerd Font
    - [ ] Google Chrome (Not sure if I really want this)

- [x] Setup Steps Automated
    - [x] Starship
    - [x] Symlinks for root user
    - [x] Symlinks for .config
    - [x] Initialize Postgres DB
        - [ ] Create tables and set up SpaceTraders content
