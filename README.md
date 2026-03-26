# 🚀 Getting Started with Zsh Configuration (Linux-NA Style)

```bash
# The setup.sh script is designed to be a "one-and-done" solution.
# It automatically installs and configures Zsh, creates your ~/.config/zsh
# directory, and populates it with the necessary configuration files.
# No manual setup required!
# will not work if no zsh or no setup.sh 
# --------------------------------------------------
# 📦 Quick Installation
# --------------------------------------------------

# 1. Download the setup script
git clone https://github.com/Ghosthx-Code/Linux-NA/tree/zshrc

cd ~/.config/zsh/.zshrc
#add .zshrc from the githib to the .zshrc
# --------------------------------------------------
# ⚙️ What This Does
# --------------------------------------------------
# - Sets Zsh as your default shell
# - Creates ~/.config/zsh directory
# - Applies preconfigured .zshrc and theme settings
# - Optionally installs plugins (autosuggestions, syntax highlighting)

# After running, restart your terminal or run:
exec zsh
