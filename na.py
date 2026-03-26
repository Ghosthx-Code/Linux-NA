#!/usr/bin/env python3
import socket, os

class Color:
    BLUE = '\033[94m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    RESET = '\033[0m'

user = socket.gethostname()

while True:
    # 1. Get current path and simplify /home/user to ~
    pwd = os.getcwd()
    home = os.path.expanduser("~")
    display_pwd = pwd.replace(home, "~")

    # 2. Get input
    try:
        user_input = input(f'{Color.YELLOW}({Color.RED}{user}{Color.YELLOW}) ~ [ {Color.RED}$ {Color.BLUE}{display_pwd}{Color.YELLOW} ] ~ > {Color.RESET}').strip()
    except EOFError: # Handles Ctrl+C
        break

    if not user_input:
        continue

    # 3. MANUALLY HANDLE 'cd'
    if user_input.startswith("cd "):
        # Extract the path (everything after 'cd ')
        path = user_input[3:].strip()
        try:
            # Expand ~ to actual home path and change directory
            os.chdir(os.path.expanduser(path))
        except FileNotFoundError:
            print(f"{Color.RED}Directory not found: {path}{Color.RESET}")
        except Exception as e:
            print(f"{Color.RED}Error: {e}{Color.RESET}")
            
    elif user_input == "cd":
        os.chdir(home)

    elif user_input in ["exit", "quit"]:
        break

    # 4. RUN ALL OTHER COMMANDS
    else:
        os.system(user_input)
