# 🚀 Getting Started with Linux-NA

The `setup.sh` script is designed to be a "one-and-done" if you have all of `~/setup` folder. It automatically generates your `~/.config` directories and populates them with the correct files. No manual folder creation required!

Make Sure you put all the files in there dir and make a folder call `main_setup` you will put all the files, folders in there

---

### 📦 Quick Installation

To get your environment running in seconds, simply copy and paste the command block below into your terminal:

```bash
# --- 🚀 THE LINUX-NA ONE-COMMAND INSTALL ---

# 1. Update and ensure Git is installed
sudo apt update && sudo apt install -y git

# 2. Clone the repository (Into your home folder)
git clone https://github.com/Ghosthx-Code/Linux-NA

# 3. Move into the setup directory
cd ~/Linux-NA/setup || { echo "❌ Setup folder not found!"; exit 1; }

# 4. Make the script executable
chmod +x setup.sh

# 5. Launch the Magic 
./setup.sh

