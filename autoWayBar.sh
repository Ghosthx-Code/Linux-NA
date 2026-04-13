# This will OVERWRITE the file with the text below
cat <<EOF > ~/.config/waybar/config.jsonc
{
// ============================================================
// ✨ WAYBAR "EASY-MODE" CONFIGURATION ✨
// ============================================================
// Quick Tips:
// 1. To DISABLE something, put // at the start of the line.
// 2. To ENABLE something, remove the // from the start.
// 3. Icons require "Font Awesome" or "Nerd Fonts" installed.
// ============================================================

{
    // --- 🖥️ BAR APPEARANCE ---
    "layer": "top",          // "top" = always visible; "bottom" = windows cover it
    "position": "top",       // Where it sits: "top", "bottom", "left", or "right"
    "height": 34,            // Height of the bar in pixels
    "margin": "5 10 5 10",   // Space around the bar (Top Right Bottom Left)
    "spacing": 10,           // Space between the buttons/modules

    // --- 🧩 MODULE LAYOUT ---
    // (Move these names around to change where they sit on your screen)
    "modules-left":   ["wlr/workspaces", "cpu", "memory"], 
    "modules-center": ["clock"],
    "modules-right":  ["pulseaudio", "network", "tray"],

    // --- 🕒 CLOCK & CALENDAR ---
    "clock": {
        "format": "🕒 {:%H:%M}",             // %H:%M = 24hr. Change to %I:%M %p for 12hr.
        "tooltip-format": "📅 {:%A, %B %d}", // Shows full date when you hover
        "on-click": "gnome-calendar"         // CLICK to open your calendar app
    },

    // --- 🔊 VOLUME CONTROL ---
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": "🔇 Muted",
        "format-icons": ["", "", ""],
        "on-click": "pavucontrol",           // LEFT CLICK to open volume mixer
        "on-click-right": "pactl set-sink-mute @DEFAULT_SINK@ toggle" // RIGHT CLICK to mute
    },

    // --- 🌐 INTERNET & WIFI ---
    "network": {
        "format-wifi": "  {essid}",         // Shows WiFi name
        "format-ethernet": "   Wired",         // Shows when plugged into a cable
        "format-disconnected": "⚠ No Net",
        "tooltip-format": "IP: {ipaddr}",    // Hover to see your IP address
        "on-click": "nm-connection-editor"   // CLICK to pick a WiFi network
    },

    // --- 🔋 BATTERY (Only shows if you're on a laptop) ---
    "battery": {
        "states": { "warning": 30, "critical": 15 },
        "format": "{icon} {capacity}%",
        "format-icons": ["", "", "", "", ""],
        "format-charging": "   {capacity}%"
    },

    // --- 🖥️ SYSTEM MONITORS (CPU & RAM) ---
    "cpu": {
        "format": " {usage}%",
        "on-click": "btop"                   // CLICK to see what's slowing your PC
    },
    "memory": {
        "format": " {percentage}%",
        "tooltip-format": "{used}GB / {total}GB used"
    },

    // --- 📦 SYSTEM TRAY (Icons like Discord, Steam, etc) ---
    "tray": {
        "icon-size": 18,
        "spacing": 10
    },

    // --- 🗔 WORKSPACES (The desktop switcher) ---
    "wlr/workspaces": {
        "on-click": "activate",
        "format": "{icon}",
        "format-icons": {
            "1": "1", "2": "2", "3": "3", "4": "4", "5": "5",
            "active": "",                  // Icon for the screen you are on
            "default": ""                  // Icon for other screens
        }
    }
}
}
EOF
# This will OVERWRITE the file with the text below
cat <<EOF > ~/.config/waybar/style.css
{
/* ============================================================
   🎨 WAYBAR "EASY-STYLE" (The Look & Feel)
   ============================================================ */

/* --- 🌍 GLOBAL SETTINGS --- 
   This applies to everything on the bar. */
* {
    /* Make sure you have 'JetBrainsMono Nerd Font' installed for icons! */
    font-family: "JetBrainsMono Nerd Font Propo", sans-serif;
    font-size: 14px; 
    border: none;
    border-radius: 0;
}

/* --- 🏗️ THE MAIN BAR --- 
   This is the long rectangle that holds everything. */
window#waybar {
    background-color: #1e1e2e; /* Dark Purple/Blue background */
    color: #cdd6f4;            /* Light text color */
    border-bottom: 2px solid #89b4fa; /* A thin blue line at the bottom */
}

/* --- 💊 THE "PILL" LOOK --- 
   This makes your modules look like floating rounded buttons. 
   Add any new module names here (like #battery or #cpu). */
#workspaces, 
#clock, 
#pulseaudio, 
#network, 
#cpu, 
#memory, 
#tray {
    background-color: #313244; /* Darker grey for the 'pill' background */
    color: #89b4fa;            /* Light blue text for icons/info */
    border-radius: 15px;       /* Makes the corners rounded (Pill shape) */
    padding: 2px 12px;         /* Space inside the pill (Top/Bottom, Left/Right) */
    margin: 4px 6px;           /* Space outside the pill so they don't touch */
}

/* --- 🔘 WORKSPACE BUTTONS --- 
   How the little icons/numbers for your screens look. */
#workspaces button {
    padding: 0 5px;
    color: #cdd6f4;
    background: transparent;   /* Keep background clear unless active */
}

/* THE ACTIVE SCREEN: The one you are currently looking at */
#workspaces button.active {
    background-color: #89b4fa; /* Solid Blue background */
    color: #1e1e2e;            /* Dark text on the blue background */
    border-radius: 15px;       /* Keep the rounded look */
}

/* HOVER: What happens when your mouse touches a workspace icon */
#workspaces button:hover {
    background: rgba(137, 180, 250, 0.4); /* Faint blue highlight */
    border-radius: 15px;
}

/* --- ⚠️ WARNING COLORS --- 
   Changes colors when things get "Critical" (like low battery) */
#network.disconnected {
    background-color: #f38ba8; /* Bright Red background */
    color: #1e1e2e;            /* Dark text for visibility */
}
}
EOF

