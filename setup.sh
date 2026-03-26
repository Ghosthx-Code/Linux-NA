#!/bin/bash

# ============================================================
# 🚀 THE ULTIMATE UBUNTU "GHOST" SETUP SCRIPT
# ============================================================

echo "📦 Step 1: Installing Core Apps..."
# Runs your custom python installer
python3 /home/ghost/main_setup/setup/apps.py 

echo "🌙 Step 2: Setting up Neovim (The Editor)..."
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update && sudo apt install -y neovim git curl

# Backup old config if it exists so we don't lose anything
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak_$(date +%Y%m%d)

# Clone a fresh "LazyVim" starter template
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git # Removes the git history to make it yours

echo "🎨 Step 3: Setting up Waybar & Rofi Folders..."
mkdir -p ~/.config/rofi ~/.config/waybar

# Only copy default configs if your custom ones don't exist yet
# ============================================================
# 🎨 STEP 3: WAYBAR & ROFI CONFIGURATIONS
# ============================================================
echo "🛠️  Configuring Waybar and Rofi..."

# Ensure the config directories exist
mkdir -p ~/.config/waybar ~/.config/rofi

# --- WAYBAR SETUP ---
# 1. Copy default JSON config if missing
if [ ! -f ~/.config/waybar/config.jsonc ]; then
    cp /etc/xdg/waybar/config ~/.config/waybar/config.jsonc 2>/dev/null || \
    cp /etc/xdg/waybar/config.jsonc ~/.config/waybar/config.jsonc 2>/dev/null || \
    echo "⚠️  Waybar default config not found in /etc/xdg/waybar/"
fi

# 2. Copy default CSS style if missing
if [ ! -f ~/.config/waybar/style.css ]; then
    cp /etc/xdg/waybar/style.css ~/.config/waybar/style.css 2>/dev/null || \
    echo "⚠️  Waybar default style.css not found!"
fi

# --- ROFI SETUP ---
# 3. Create a default config.rasi if missing
# We use 'rofi -dump-config' to generate a clean, system-correct template
if [ ! -f ~/.config/rofi/config.rasi ]; then
    rofi -dump-config > ~/.config/rofi/config.rasi 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ Generated new Rofi config.rasi"
    else
        echo "⚠️  Could not generate Rofi config. (Is Rofi installed?)"
    fi
fi


echo "⌨️  Step 4: Programming GNOME Keybindings..."

# 1. Clear the default terminal shortcut to avoid conflicts
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['']"

# 2. Define our custom shortcuts list
BIND_PATH="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding"
KEYS="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

# This list tells GNOME which "slots" to look at
LIST="['$KEYS/custom0/', '$KEYS/custom1/', '$KEYS/custom2/', '$KEYS/custom3/', '$KEYS/custom4/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$LIST"

# --- SHORTCUT 0: QTerminal ---
# Key: Ctrl + Alt + T
gsettings set $BIND_PATH:$KEYS/custom0/ name "QTerminal"
gsettings set $BIND_PATH:$KEYS/custom0/ command "qterminal"
gsettings set $BIND_PATH:$KEYS/custom0/ binding "<Control><Alt>t"

# --- SHORTCUT 1: Rofi (App Launcher) ---
# Key: Alt + Space
gsettings set $BIND_PATH:$KEYS/custom1/ name "Rofi Launcher"
gsettings set $BIND_PATH:$KEYS/custom1/ command "rofi -show drun"
gsettings set $BIND_PATH:$KEYS/custom1/ binding "<Alt>space"

# --- SHORTCUT 2: Kill Rofi ---
# Key: Ctrl + Space (Emergency Close)
gsettings set $BIND_PATH:$KEYS/custom2/ name "Kill Rofi"
gsettings set $BIND_PATH:$KEYS/custom2/ command "killall rofi"
gsettings set $BIND_PATH:$KEYS/custom2/ binding "<Control>space"

# --- SHORTCUT 3: Start Waybar ---
# Key: Ctrl + Alt + Space
gsettings set $BIND_PATH:$KEYS/custom3/ name "Start Waybar"
gsettings set $BIND_PATH:$KEYS/custom3/ command "waybar"
gsettings set $BIND_PATH:$KEYS/custom3/ binding "<Control><Alt>space"

# --- SHORTCUT 4: Reload/Kill Waybar ---
# Key: Shift + Ctrl + Alt + Space
gsettings set $BIND_PATH:$KEYS/custom4/ name "Kill Waybar"
gsettings set $BIND_PATH:$KEYS/custom4/ command "killall waybar"
gsettings set $BIND_PATH:$KEYS/custom4/ binding "<Shift><Control><Alt>space"

echo "✅ SETUP COMPLETE! Restarting GNOME Shell is recommended."

bash ~/main_setup/setup/autoRofi.sh
bash ~/main_setup/setup/autoWayBar.sh
