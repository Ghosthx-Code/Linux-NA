# 🚀 Getting Started with Zsh Configuration (Linux-NA Style)

```bash
# The setup.sh script is designed to be a "one-and-done" solution.
# It automatically installs and configures Zsh, creates your ~/.config/zsh
# directory, and populates it with the necessary configuration files.
# No manual setup required!

# --------------------------------------------------
# 📦 Quick Installation
# --------------------------------------------------

# 1. Download the setup script
curl -O https://raw.githubusercontent.com/your-repo/linux-na/main/setup.sh

# 2. Make it executable
chmod +x setup.sh

# 3. Run the script to install and configure Zsh
./setup.sh

# --------------------------------------------------
# ⚙️ What This Does
# --------------------------------------------------
# - Installs Zsh (if not already installed)
# - Sets Zsh as your default shell
# - Creates ~/.config/zsh directory
# - Applies preconfigured .zshrc and theme settings
# - Optionally installs plugins (autosuggestions, syntax highlighting)

# After running, restart your terminal or run:
exec zsh
