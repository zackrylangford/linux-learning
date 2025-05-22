# 🧾 Bash Scripting Lesson 1: Getting Started

## 🎯 Goal
Learn the absolute basics of Bash scripting by writing, executing, and organizing a simple Hello World script. Set up your personal scripting environment using best practices for Linux servers and cloud environments.

---

## 🧠 What You’ll Learn
- What a Bash script is
- How to create and run your first script
- What the shebang line does
- Where to store scripts on your Linux system
- How to make a script executable and callable from anywhere

---

## 🧱 Prerequisites
- Any Linux terminal (AlmaLinux, Ubuntu, etc.)
- Basic familiarity with the shell
- A user account with access to bash and file permissions

---

## 🪛 Step-by-Step Instructions

### ✅ Step 1: Create a New Script
Open your terminal and run:

```bash
nano hello.sh
```

Paste the following into the file:

```bash
#!/bin/bash

echo "Hello, world!"
```

### ✅ Step 2: Make the Script Executable

```bash
chmod +x hello.sh
```

### ✅ Step 3: Run the Script

```bash
./hello.sh
```

You should see:

```
Hello, world!
```

---

## 📂 Step 4: Organize Your Scripts (Best Practice)

Create a `~/bin` directory if it doesn’t exist:

```bash
mkdir -p ~/bin
```

Move your script there:

```bash
mv hello.sh ~/bin/
```

Add `~/bin` to your `PATH` (if not already in it):

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Now you can run your script from anywhere:

```bash
hello.sh
```

---

## 🔍 Key Concepts

| Concept         | Explanation                                                                 |
|-----------------|-----------------------------------------------------------------------------|
| `#!/bin/bash`   | The shebang tells the system to use Bash to interpret the script.           |
| `chmod +x`      | Makes the script executable. Without this, the OS won’t run it.             |
| `~/bin`         | A personal directory for user scripts that’s safe and standard.             |
| `$PATH`         | Tells your shell where to look for executables. Adding `~/bin` means your scripts can be run globally like normal commands. |

---

## ✅ Mini-Challenge: Create Another Script

Create a greeting script:

```bash
nano ~/bin/greet.sh
```

Paste:

```bash
#!/bin/bash

read -p "Enter your name: " name
echo "Hello, $name! Welcome to AlmaLinux."
```

Make it executable:

```bash
chmod +x ~/bin/greet.sh
```

Run it:

```bash
greet.sh
```

---

## 🔐 Server/Cloud Notes
- On servers, place scripts in:
  - `/usr/local/bin` (shared system-wide scripts)
  - `~/bin` (for per-user scripts)
- Keep secrets out of scripts — use environment variables or AWS Parameter Store
- Use version control for important scripts (e.g., GitHub or GitLab)

---

## 🧠 Review Questions
- What does the `#!/bin/bash` line do?
- Why do we use `chmod +x` on scripts?
- What is the purpose of `~/bin`?
- How does adding to `$PATH` help?
- How would you safely organize automation scripts for cloud servers?

---

## 🧪 Ready for Next Time?
In Lesson 2, you’ll learn:
- Variables in Bash
- Using `read`, `echo`, and simple string manipulation
- Writing a reusable info script (e.g., user info or system summary)

---

*Let me know if you'd like this as a Markdown or .txt file for easy inclusion in your site or Obsidian.*
