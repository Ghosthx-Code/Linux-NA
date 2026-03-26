# 🚀 Getting Started with Linux-NA

The `setup.sh` script is designed to be a "one-and-done" solution. It automatically generates your `~/.config` directories and populates them with the correct files. No manual folder creation required!

---

### 📦 Quick Installation

To get your environment running in seconds, simply copy and paste the command block below into your terminal:

```bash
# --- 🚀 THE LINUX-NA ONE-COMMAND INSTALL ---

# 1. Update and ensure Git is installed
sudo apt update && sudo apt install -y git

# 2. Clone the repository (Into your home folder)
git clone https://github.com ~/Linux-NA

# 3. Move into the setup directory
cd ~/Linux-NA/setup || { echo "❌ Setup folder not found!"; exit 1; }

# 4. Make the script executable
chmod +x setup.sh

# 5. Launch the Magic 
./setup.sh

