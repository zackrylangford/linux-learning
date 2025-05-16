# 🧾 Bash Scripting Lesson 2: Variables, Input, and String Manipulation

## 🎯 Goal
Understand how to declare and use variables, accept user input, and manipulate strings. Build a script that displays basic user/system information.

---

## 🧱 Prerequisites
- Completion of Lesson 1
- A Linux terminal
- Scripts directory `~/bin/` added to your `$PATH`

---

## 🪛 Step-by-Step Instructions

### ✅ Step 1: Create a New Script
```bash
nano ~/bin/sysinfo.sh
```

Paste this content:
```bash
#!/bin/bash

# Get the user's name
read -p "Enter your name: " username

# Get system info
hostname=$(hostname)
uptime_info=$(uptime -p)
current_time=$(date)

# Output message
echo ""
echo "Hello, $username!"
echo "This is $hostname."
echo "The system has been up for: $uptime_info"
echo "Current time is: $current_time"
```

---

### ✅ Step 2: Make It Executable
```bash
chmod +x ~/bin/sysinfo.sh
```

---

### ✅ Step 3: Run It
```bash
sysinfo.sh
```

---

## 🔍 Key Concepts

| Concept           | Explanation                                            |
|-------------------|--------------------------------------------------------|
| `variable=value`  | Declares a variable (no spaces around `=`)            |
| `$(command)`      | Runs a command and captures the output                |
| `read -p`         | Prompts the user and stores their input               |
| `echo "$var"`     | Prints the contents of a variable                     |

---

## ✅ Mini-Challenge

Create a script called `quickcheck.sh` that:

- Gets the number of users currently logged in using `who | wc -l`
- Shows disk usage with `df -h /`
- Greets the user using `$USER` and `$HOME`

Bonus: Format your output nicely using `echo` and some divider lines (`======`).

---

## 🔐 Server/Cloud Notes

- Use `$(hostname)` and `$(uptime)` to gather instance diagnostics
- Store reusable system checks in `~/bin/` or `/usr/local/bin`
- Use cron to schedule regular info scripts (`crontab -e`)

---

## 🧠 Review Questions

1. What’s the syntax for assigning a variable?
2. How do you prompt a user for input?
3. How can you get system information using Bash?
4. Why is command substitution useful in scripts?

---

## 🔜 Coming Up in Lesson 3

You’ll learn:
- Conditionals and logic in Bash
- Basic `if` statements
- Using comparison operators to make decisions

---