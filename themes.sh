#!/bin/bash

# ============================================================
# 🌍 THE ULTIMATE FULL-OS THEME SETUP
# ============================================================

# 1. 🔄 UPDATE & INSTALL SYSTEM TOOLS
echo "🔄 Updating system..."
sudo apt update -y && sudo apt install -y eza bat fastfetch zoxide gnome-tweaks

# Fix 'bat' naming for Ubuntu
mkdir -p ~/.local/bin
[ ! -f ~/.local/bin/bat ] && ln -s /usr/bin/batcat ~/.local/bin/bat

# 2. 🎨 FULL OS THEME MENU
echo -e "\n✨ --- CHOOSE YOUR ENTIRE SYSTEM VIBE ---"
options=("Modern Dark (Pro)" "Classic Light (Clean)" "Cyberpunk (High Contrast)" "Keep Current")
PS3='Select your OS style (1-4): '

select opt in "${options[@]}"
do
    case $opt in
        "Modern Dark (Pro)")
            echo "🌙 Applying Full Dark Theme..."
            # Interface & Colors
            gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
            gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
            # Icons & Cursor
            gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
            gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
            # Wallpaper (Ubuntu Default Dark)
            gsettings set org.gnome.desktop.background picture-uri-dark 'file:///usr/share/backgrounds/warty-final-ubuntu.png'
            break
            ;;
        "Classic Light (Clean)")
            echo "☀️ Applying Full Light Theme..."
            gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
            gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
            gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
            gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/warty-final-ubuntu.png'
            break
            ;;
        "Cyberpunk (High Contrast)")
            echo "👁️ Applying High Contrast Theme..."
            gsettings set org.gnome.desktop.interface gtk-theme 'HighContrast'
            gsettings set org.gnome.desktop.interface icon-theme 'HighContrast'
            break
            ;;
        "Keep Current")
            echo "⏭️ No OS changes made."
            break
            ;;
        *) echo "❌ Invalid option $REPLY";;
    esac
done

# 3. ⚙️ SETUP TERMINAL ALIASES
echo -e "\n⚙️ Updating terminal shortcuts..."
if ! grep -q "# Custom CLI Aliases" ~/.zshrc; then
    {
        echo -e "\n# Custom CLI Aliases"
        echo "alias ls='eza --icons --group-directories-first'"
        echo "alias ll='eza -lh --icons --group-directories-first'"
        echo "alias cat='bat'"
        echo 'eval "$(zoxide init zsh)"'
        echo "fastfetch"
    } >> ~/.zshrc
    echo "✅ ZSH Aliases added!"
fi

# 4. 🎉 FINISH & REFRESH
echo -e "\n🚀 ALL DONE!"
echo "👉 Pro Tip: Use 'gnome-tweaks' to fine-tune your new look."
