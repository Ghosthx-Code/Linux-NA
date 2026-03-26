### 🎨 Color Palette Reference (Catppuccin Mocha)


| Name | Hex Code | Preview |
| :--- | :--- | :--- |
| **Background** | `#1e1e2e` | ![](https://via.placeholder.com+) |
| **Pill Background** | `#313244` | ![](https://via.placeholder.com+) |
| **Main Text** | `#cdd6f4` | ![](https://via.placeholder.com+) |
| **Blue Accent** | `#89b4fa` | ![](https://via.placeholder.com+) |
| **Lavender** | `#b4befe` | ![](https://via.placeholder.com+) |
| **Mauve Purple** | `#cba6f7` | ![](https://via.placeholder.com+) |
| **Red (Error)** | `#f38ba8` | ![](https://via.placeholder.com+) |
| **Green (Success)** | `#a6e3a1` | ![](https://via.placeholder.com+) |
| **Yellow (Warning)** | `#f9e2af` | ![](https://via.placeholder.com+) |
| **Peach (Orange)** | `#fab387` | ![](https://via.placeholder.com+) |
| **Teal (Info)** | `#94e2d5` | ![](https://via.placeholder.com+) |
| **Sky Cyan** | `#89dceb` | ![](https://via.placeholder.com+) |

---

### 🌫️ Neutrals & Borders

*   **Surface Bright** = `#45475a` ![](https://via.placeholder.com+)
*   **Subtext Dim** = `#a6adc8` ![](https://via.placeholder.com+)
*   **Overlay Gray** = `#6c7086` ![](https://via.placeholder.com+)
*   **Hard Black** = `#11111b` ![](https://via.placeholder.com+)

---

### 💡 Implementation Tip
If you are using these in your **Waybar `style.css`**, define them at the top like this:
```css
@define-color base   #1e1e2e;
@define-color blue   #89b4fa;
@define-color red    #f38ba8;
```
# 🛠️ Linux-NA Customization Guide

### 🛰️ Waybar (The Taskbar)
Edit these in `~/.config/waybar/`

```jsonc
// 1. Change Layout (config.jsonc)
"modules-left": ["wlr/workspaces"],   // Elements on the left
"modules-center": ["clock"],           // Elements in the middle
"modules-right": ["pulseaudio"]        // Elements on the right

// 2. Change Colors (style.css)
#clock {
    background-color: #313244;  /* Pill Color */
    color: #89b4fa;             /* Text Color */
    border-radius: 10px;        /* Roundness */
}

// 3. Time Format (12h vs 24h)
"format": "{:%H:%M}"            // 24-Hour (13:00)
"format": "{:%I:%M %p}"         // 12-Hour (01:00 PM)
