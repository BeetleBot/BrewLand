# ☕ BrewLand v2.0

<div align="center">

![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-00A896?style=for-the-badge&logo=hyprland&logoColor=white)
![Catppuccin](https://img.shields.io/badge/Theme-Catppuccin-F5C2E7?style=for-the-badge)
![License](https://img.shields.io/badge/License-GPL%203.0-blue?style=for-the-badge)

**An elegant, zero-nonsense Hyprland setup brewed with Catppuccin Mocha & Latte.**

</div>

> **⚠️ Notice:** The `stable` branch is highly stable and may not receive updates for the next few months. Active development has shifted to the `beta` branch. Once new features are tested and stabilized, they will be merged back into stable.

## 📖 About This Setup

**BrewLand** is a dotfiles configuration that blends style, performance, and minimalism into one cohesive Hyprland experience. Built heavily around the [Catppuccin Mocha and Latte](https://github.com/catppuccin/catppuccin) palettes, it delivers rich colors, smooth animations, and zero fluff.

Think of it as the perfect espresso shot for your Linux desktop: **smooth, bold, and just the right amount of aesthetic kick.**

## ✨ Features

- **🎨 Dual Theme:** Seamlessly switch between Catppuccin Mocha (Dark) and Latte (Light) everywhere—from your terminal to the notification center. Includes a `theme_switcher.sh` script to configure GTK and QT apps manually.
- **🖼️ Dynamic Wallpapers:** Uses `swww` for dynamic wallpaper switching, powered by a custom wallpaper picker built with Rofi.
- **🔍 Deep Rofi Integration:** A fully integrated Rofi ecosystem for application launching, emoji picking, file searching, wallpaper selection, and music picking.
- **🔔 Notification Center:** Beautifully styled `SwayNC` with custom Catppuccin CSS, perfectly integrated with the Waybar module.
- **🖥️ Master Layout:** Configured for a productive master-stack workflow, featuring a custom "Shelf" (special workspace) for minimized/background apps.
- **🔒 Integrated Lock Screen:** A cohesive `hyprlock` + `hypridle` setup for seamless security and power management.
- **🌐 Network & Bluetooth:** Features well-built `impala` (WiFi) and `bluetui` (Bluetooth) setups, mapped to custom keybinds and Waybar modules.

## 🧰 Core Components

| Component | Tool | Description |
| :--- | :--- | :--- |
| **Compositor** | [Hyprland](https://hyprland.org/) | Dynamic tiling Wayland compositor |
| **Bar** | [Waybar](https://github.com/Alexays/Waybar) | Highly customized status bar with blur |
| **Wallpapers**| [swww](https://github.com/LGFae/swww) | Handles dynamic background management |
| **Notifications**| [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) | Notification center with Catppuccin CSS |
| **Terminal** | [Kitty](https://sw.kovidgoyal.net/kitty/) | GPU-accelerated terminal emulator |
| **Launcher** | [Rofi](https://github.com/davatorium/rofi) | Search-driven application and system launcher |
| **Screenshots** | [Grimblast](https://github.com/hyprwm/contrib/tree/main/grimblast) | Essential screenshot utility |
| **Lock Screen** | [Hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) | Integrated, customized screen lock |
| **Font** | [iMWritingMono Nerd](https://www.nerdfonts.com/) | Primary font for Waybar and system UI |

## ⚙️ Installation

### Prerequisites
Before installing, ensure you are running **Arch Linux**. The installer relies on Arch package managers (`pacman` and `yay`).

### Quick Install

Fire it up in just a few simple steps. The installer will automatically verify your OS, set up `yay`, install dependencies, back up your current configs to `~/ConfigBackup/`, and deploy BrewLand.

```bash
git clone [https://github.com/BeetleBot/BrewLand.git](https://github.com/BeetleBot/BrewLand.git)
cd BrewLand
chmod +x install.sh
./install.sh

```

*Note: A system reboot is recommended after the installation is complete.*

## ⌨️ Keybindings

The **Super** (Windows) key is your primary modifier.

### General & System

| Keybind | Action |
| --- | --- |
| `Super + Return` | Open Terminal |
| `Super + Q` | Kill Active Window |
| `Super + X` | Exit Hyprland |
| `Super + Shift + X` | Poweroff |
| `Super + Shift + R` | Reboot |
| `Super + Shift + L` | Lock Screen (Hyprlock) |
| `Super + R` | Reload Waybar (`waybar-relaunch.sh`) |
| `Super + Shift + Z` | Toggle Theme (`theme_switcher.sh`) |

### Applications

| Keybind | Action |
| --- | --- |
| `Super + E` | File Manager |
| `Super + W` | Browser (Zen Browser) |
| `Super + C` | Editor (Codium) |
| `Super + O` | Notes (Obsidian) |
| `Super + F` | Fadein |

### Rofi Menus & Utilities

| Keybind | Action |
| --- | --- |
| `Super + Space` | Open App Launcher |
| `Super + /` | Clipboard History |
| `Super + .` | Emoji Picker |
| `Super + Alt + Space` | Search Files |
| `Super + Shift + W` | Wallpaper Menu |
| `Super + Shift + M` | Music Menu |
| `Super + Alt + N` | Network Manager (`impala`) |
| `Super + Alt + B` | Bluetooth Manager (`bluetui`) |
| `Super + Shift + D` | Drive Script |
| `Super + Shift + B` | Backup Drive Script |

### Window Management & Layout

| Keybind | Action |
| --- | --- |
| `Super + Arrows` | Move Focus (Up/Down/Left/Right) |
| `Super + Shift + Left` | Swap Window with Master |
| `Super + V` | Toggle Floating Mode |
| `Super + G` | Toggle Tabbed Group |
| `Super + Tab` | Cycle Active Group |
| `Super + Left Click` | Move Floating Window (Drag) |
| `Super + Right Click` | Resize Floating Window (Drag) |

### Workspaces

| Keybind | Action |
| --- | --- |
| `Super + 1-0` | Switch to Workspace 1-10 |
| `Super + Shift + 1-0` | Move Active Window to Workspace 1-10 |
| `Super + Scroll` | Cycle Through Workspaces |
| `Super + S` | Toggle "Magic" Shelf (Special Workspace) |
| `Super + Shift + S` | Move Active Window to "Magic" Shelf |
| `Super + Alt + S` | Bring Window to Current Workspace |

### Screenshots (Grimblast)

| Keybind | Action |
| --- | --- |
| `Super + Alt + 1` | Screenshot Monitor (Copy/Save) |
| `Super + Alt + 2` | Screenshot Active Window (Copy/Save) |
| `Super + Alt + 3` | Screenshot Region (Freeze/Copy/Save) |

### Multimedia & Hardware

*Standard multimedia keys (XF86) are fully mapped for ease of use.*
| Keybind | Action |
| :--- | :--- |
| `Volume Up / Down` | Adjust Volume (via `wpctl`) |
| `Mute` | Toggle Audio Mute |
| `Mic Mute` | Toggle Microphone Mute |
| `Brightness Up/Down` | Adjust Screen Brightness (`brightnessctl`) |
| `Media Keys` | Play, Pause, Next, Previous (`playerctl`) |

## ☕ Screenshots

*(Note: Ensure these filenames include their correct extensions and paths, e.g., `assets/20260122_163322.png` if you have placed them in an assets folder)*

### Light & Dark Themes

| Dark Mode (Mocha) | Light Mode (Latte) |
| --- | --- |
|  |  |
|  |  |
|  |  |



*Created with ❤️ by BeetleBot.*
