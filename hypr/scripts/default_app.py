#!/usr/bin/env python3
import json
import subprocess

def main():
    # Get monitors data
    monitors_data = get_monitors_data()

    if monitors_data:
        # Access the 'activeWorkspace' from the parsed JSON
        current_workspace = str(monitors_data[0].get('activeWorkspace', {}).get('name', ''))

        # Open default app for the current workspace
        open_default_app(current_workspace)

def get_monitors_data():
    # Use subprocess.run to execute the command and capture output
    result = subprocess.run(['hyprctl', '-j', 'monitors'], capture_output=True, text=True)

    # Check if the command was successful
    if result.returncode == 0:
        # Parse the JSON from the captured output
        monitors_data = json.loads(result.stdout)
        return monitors_data
    else:
        print(f"Error: {result.stderr}")
        return None

def open_default_app(current_workspace):
    group_apps = {
        "1": "code",
        "2": "brave",
        "3": "kitty",
        "4": "obsidian",
        "5": "thunar",
        "6": "~/.config/rofi/types/type-7/launcher.sh",
        "7": "steam",
        "8": "spotify",
        "9": "google-chrome-stable"
    }

    default_app = group_apps.get(current_workspace)
    if default_app:
        subprocess.run([f'{default_app}'])

if __name__ == "__main__":
    main()