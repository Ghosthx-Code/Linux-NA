import json
import re
import subprocess
import sys

def load_jsonc_key(file_path, key_name):
    """Safely loads a key from a JSON file that has // or /* comments."""
    try:
        with open(file_path, 'r') as f:
            # This regex removes both // and /* */ comments
            content = f.read()
            content = re.sub(r'//.*|/\*[\s\S]*?\*/', '', content)
            data = json.loads(content)
            return data.get(key_name, [])
    except FileNotFoundError:
        print(f"❌ Error: {file_path} not found!")
        return []
    except json.JSONDecodeError:
        print(f"❌ Error: {file_path} has a syntax error (check your commas!)")
        return []

def install_apps():
    # 1. Load the list
    apps = load_jsonc_key('apps.jsonc', 'apps')
    
    if not apps:
        print("📭 No apps found to install. Check your apps.jsonc file.")
        return

    print(f"🚀 Found {len(apps)} apps to install.")
    
    # 2. Update the system first (Standard Best Practice)
    print("🔄 Updating system package lists...")
    subprocess.run(['sudo', 'apt', 'update'], check=True)

    # 3. Install apps one-by-one
    # Installing one-by-one is friendlier because if one fails, 
    # the rest will still finish!
    for i, app in enumerate(apps, 1):
        print(f"📦 [{i}/{len(apps)}] Installing: {app}...")
        
        # We use 'capture_output' to keep the screen clean unless there's an error
        result = subprocess.run(['sudo', 'apt', 'install', '-y', app], 
                                capture_output=True, text=True)
        
        if result.returncode == 0:
            print(f"✅ {app} installed successfully!")
        else:
            print(f"⚠️  Could not install {app}. Skipping...")
            # Optional: save errors to a log file
            with open("install_errors.log", "a") as log:
                log.write(f"Failed to install {app}:\n{result.stderr}\n")

    print("\n🎉 All done! Check 'install_errors.log' if anything failed.")

if __name__ == "__main__":
    install_apps()
