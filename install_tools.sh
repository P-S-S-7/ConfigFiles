#!/bin/bash

# ------------------------------------------------------
# Install fzf - A powerful command-line fuzzy finder
# ------------------------------------------------------

# Update package lists and install fzf
sudo apt update
sudo apt install -y fzf

# ------------------------------------------------------
# Install bat - A modern replacement for cat
# ------------------------------------------------------

# Update package lists and install bat
sudo apt update
sudo apt install -y bat

# Create a local bin directory if it doesn't exist and symlink batcat to bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# ------------------------------------------------------
# Install eza - A modern replacement for ls written in Rust
# ------------------------------------------------------

# Install gpg if it's not already installed (required for eza installation)
sudo apt update
sudo apt install -y gpg

# Install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Add eza alias to .zshrc
echo '# eza alias' >> ~/.zshrc
echo 'alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"' >> ~/.zshrc

# ------------------------------------------------------
# Install tldr - Simplified and community-driven man pages
# ------------------------------------------------------

# Update package lists and install tldr
sudo apt update
sudo apt install -y tldr

# ------------------------------------------------------
# Install thefuck - Correct console command mistakes
# ------------------------------------------------------

# Create a Python virtual environment and install thefuck
python3 -m venv myenv
source myenv/bin/activate
pip uninstall thefuck
pip install https://github.com/nvbn/thefuck/archive/master.zip

# Add thefuck function and automatic activation to .zshrc
echo '# thefuck function and automatic activation' >> ~/.zshrc
echo 'function thefuck() {' >> ~/.zshrc
echo '    source ~/myenv/bin/activate' >> ~/.zshrc
echo '    command thefuck "$@"' >> ~/.zshrc
echo '}' >> ~/.zshrc
echo '' >> ~/.zshrc
echo '# Automatically activate the virtual environment' >> ~/.zshrc
echo 'if [ -d "$HOME/myenv" ]; then' >> ~/.zshrc
echo '    source "$HOME/myenv/bin/activate"' >> ~/.zshrc
echo 'fi' >> ~/.zshrc

# Add thefuck alias to .zshrc
echo 'eval $(thefuck --alias)' >> ~/.zshrc

# ------------------------------------------------------
# Install Visual Studio Code - A powerful source-code editor
# ------------------------------------------------------

# Install the GPG key and add the VS Code repository
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Update package lists and install Visual Studio Code
sudo apt update
sudo apt install -y code

# ------------------------------------------------------
# Install Discord - A popular communication app for gamers and communities
# ------------------------------------------------------

# Download and install Discord from the official repository
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
rm discord.deb

# ------------------------------------------------------
# Install Gedit - A simple text editor for GNOME
# ------------------------------------------------------

# Update package lists and install Gedit
sudo apt update
sudo apt install -y gedit

# ------------------------------------------------------
# Install Neofetch - A command-line system information tool
# ------------------------------------------------------

# Update package lists and install Neofetch
sudo apt update
sudo apt install -y neofetch

# ------------------------------------------------------
# Install Obsidian - A powerful knowledge management tool
# ------------------------------------------------------

# Download and install Obsidian from the official website
wget -O obsidian.deb "https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.5/Obsidian-1.3.5.deb"
sudo apt install -y ./obsidian.deb
rm obsidian.deb

# ------------------------------------------------------
# Install GNOME Tweaks - A tool to tweak advanced GNOME settings
# ------------------------------------------------------

# Update package lists and install GNOME Tweaks
sudo apt update
sudo apt install -y gnome-tweaks

# ------------------------------------------------------
# Install Flatpak - A system for building, distributing, and running sandboxed desktop applications
# ------------------------------------------------------

# Install Flatpak and add the Flathub repository
sudo apt update
sudo apt install -y flatpak
sudo apt install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc' to apply the changes."

