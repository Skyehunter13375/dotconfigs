#!/bin/bash

# Stop the running server for maintenance
sudo systemctl stop calibre-server

# Import any new epub files in the Ebooks dir
calibredb add ~/Documents/Ebooks --with-library ~/Documents/Library

# After imported, move the old files to the imported directory
mv ~/Documents/Ebooks/* ~/Documents/Ebooks_Imported/

# Restart the calibre-server process
sudo systemctl start calibre-server
