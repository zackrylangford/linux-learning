# Customizing Your Terminal Display Name (Without Changing Hostname)

If your terminal prompt is too long (e.g., `zackrylangford@zackrylangford-MacBookPro14-1:~/Projects/linux-learning$`), you can shorten it by customizing your Bash prompt (PS1) without changing your actual username or machine name.

---

## How to Set a Shorter Display Name in Bash

### 1. Edit your `~/.bashrc` file
Open your terminal and run:
```bash
nano ~/.bashrc
```

### 2. Set a custom PS1 prompt
Add this line at the end (replace `zk` with your preferred short name):
```bash
export PS1="zk:\w\$ "
```
- `zk` is your custom display name.
- `\w` shows the current working directory.
- `\$` shows `$` for normal users, `#` for root.

**Example output:**
```
zk:~/Projects/linux-learning$
```

### 2. Set a custom PS1 prompt with colors
You can add colors using special escape sequences. For example, to make your name green and the directory blue:

```bash
export PS1="\[\e[32m\]zk\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ "
```
- `\[\e[32m\]` starts green (for your name)
- `\[\e[34m\]` starts blue (for the directory)
- `\[\e[0m\]` resets to default color

**Example output:**

zk:~/Projects/linux-learning$

(With `zk` in green and the directory in blue)

### 3. Apply the changes
```bash
source ~/.bashrc
```

---

**Tip:** You can further customize your prompt with colors and more info. Let me know if you want advanced examples!