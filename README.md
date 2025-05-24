# Wellbeing System for Linux

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Shell: Bash](https://img.shields.io/badge/shell-bash-informational)](https://www.gnu.org/software/bash/)
[![Notifications: Zenity](https://img.shields.io/badge/notifications-zenity-green)](https://help.gnome.org/users/zenity/)
[![Scheduler: Cron](https://img.shields.io/badge/scheduler-cron-yellow)](https://man7.org/linux/man-pages/man5/crontab.5.html)


---

## Key Concepts

- **Focus**: Subtle, actionable prompts (no distractions)
- **Modularity**: Each reminder is a standalone script
- **Compatibility**: Designed for Linux Mint, Ubuntu, and most GNOME-based desktops
- **Simplicity**: No daemons, services, or always-on apps

---

## Table of Contents

- [Project Structure](#project-structure)
- [How It Works](#how-it-works)
- [Installation](#installation)
- [Manual Usage](#manual-usage)
- [Automated Scheduling via Cron](#automated-scheduling-via-cron)
- [Reminder Modules](#reminder-modules)
- [Customizing Reminders](#customizing-reminders)
- [Design Philosophy](#design-philosophy)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

A lightweight, modular system written in Bash that periodically displays GUI reminders to support personal wellbeing during extended computer sessions. Built for developers, remote workers, and anyone who spends extended hours on a Linux desktop.

This project leverages `cron` for scheduling and `zenity` for clean GTK-based popups.

---

## Preview

Here’s how it looks in action:

![Demo GIF](assets/previews/demo.gif)

## Project Structure

```

wellbeing-system/
├── shared/
│   └── notify.sh            # Shared function to trigger zenity popup
└── reminders/
├── visual.sh            # Reminder for eye strain (20-20-20 rule)
├── movement.sh          # Hourly stretch/move reminder
└── meal.sh              # Reminder to eat (gastritis-aware)

````

Each script is fully independent and can be invoked manually or via scheduler.

---

## How It Works

1. **Each script defines a reminder type** (e.g., eye care).
2. It sources `notify.sh`, which handles compatibility with `zenity` under cron.
3. A GTK pop-up appears with a short message encouraging a healthy habit.
4. `cron` is used to schedule these scripts at sensible intervals.

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/<your-user>/wellbeing-system.git
cd wellbeing-system
````

### 2. Make all scripts executable

```bash
chmod +x shared/notify.sh reminders/*.sh
```

### 3. Install zenity (if not installed)

```bash
sudo apt install zenity
```

---

## Manual Usage

You can manually test any reminder with:

```bash
bash reminders/visual.sh
bash reminders/movement.sh
bash reminders/meal.sh
```

This will show a minimal popup like:

```
Title: Eye Break
Message: Pause and look away for 20 seconds.
```

---

## Automated Scheduling via Cron

### Step-by-step setup:

1. Open your crontab:

```bash
crontab -e
```

2. Add the following entries:

```cron
# Eye care (every 20 min)
*/20 * * * * bash ~/wellbeing-system/reminders/visual.sh

# Posture & movement (every 60 min)
0 * * * * bash ~/wellbeing-system/reminders/movement.sh

# Meal reminder (4 times a day)
0 8,12,16,20 * * * bash ~/wellbeing-system/reminders/meal.sh
```

### Notes:

* These jobs execute in the background using your graphical environment (`DISPLAY=:0`) and D-Bus session.
* The shared `notify.sh` script ensures compatibility.

---

## Reminder Modules

### `reminders/visual.sh`

**Purpose:** Prevent digital eye strain using the 20-20-20 rule.
**Frequency:** Every 20 minutes
**Message:**
“Pause and look away for 20 seconds. Relax your eyes.”

---

### `reminders/movement.sh`

**Purpose:** Encourage regular movement to improve posture and circulation.
**Frequency:** Every hour
**Message:**
“Stand up and stretch. Reset your posture.”

---

### `reminders/meal.sh`

**Purpose:** Prevent gastritis-related discomfort by reminding you to eat on time.
**Frequency:** 4x daily (08:00, 12:00, 16:00, 20:00)
**Message:**
“Take time to eat. Avoid skipping meals.”

---

## Customizing Reminders

You can easily:

* Add new modules to the `reminders/` directory
* Adjust the timing via `crontab -e`
* Modify `shared/notify.sh` to change:

  * Notification timeout
  * Display formatting
  * Dialog type (`info`, `question`, etc.)

Want hydration, meditation, or break logging? Just copy a script and adjust the content.

---

## Design Philosophy

This project is based on behavioral science and occupational health best practices:

* **Visual fatigue** → The 20-20-20 rule
* **Sedentary strain** → Hourly mobility breaks
* **Stomach health** → Regular meals to reduce acidity

The messages are intentionally minimal. The deeper logic is documented here, not in the popup.

---

## Dependencies

Only one runtime dependency:

```bash
sudo apt install zenity
```

Cron is built-in on most Linux systems.

---

## License

MIT License — free to use, modify, and distribute with attribution.

---

## Author

Maintained by [@fbarquez](https://github.com/fbarquez)

> “Wellness isn’t a distraction — it’s a foundation for better work.”

---

