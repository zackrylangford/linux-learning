🔐 Lesson 1: Introduction to SELinux on AlmaLinux
Objective: Understand your current SELinux mode, read basic audit logs, and learn how to interpret SELinux status.
⏱️ Time Budget: 30 Minutes

✅ Part 1 – Check SELinux Status (5–7 minutes)
Commands:
getenforce
sestatus

What to Learn:
What mode is SELinux in? (Enforcing, Permissive, or Disabled)
What does that mode mean for the system?
Check if any SELinux policies are loaded.
🧠 Tip: Use man selinux and man sestatus for quick documentation lookup.

✅ Part 2 – Explore SELinux Audit Logs (10 minutes)
Commands:
sudo less /var/log/audit/audit.log

Tasks:
Look for recent denials (search for denied or avc: denied)
Pick one denial message and Google it or write it down to understand.
🧠 Tip: Use /denied in less to quickly jump between entries.

✅ Part 3 – Test restorecon and Context Awareness (8–10 minutes)
Steps:
Create a test file in your home directory:
touch ~/selinux_testfile

Check the current context:
ls -Z ~/selinux_testfile

Run restorecon:
sudo restorecon -v ~/selinux_testfile

Observe if anything changes.
Bonus (if time):
man restorecon


🧾 Wrap-Up: Journal What You Learned (3–5 minutes)
In your linux.zackrylangford.com or local Obsidian vault, create a log entry:
# AlmaLinux Lesson 1: SELinux Basics

## Date: [Insert Today's Date]

- SELinux mode: [Enforcing / Permissive / Disabled]
- Learned how to check SELinux status
- Explored audit log: found denial = [example line]
- Ran `restorecon` on test file
- Questions for future sessions:
  - [ ]
  - [ ]


Absolutely — here’s a clean, journal-style writeup of today’s SELinux demo and review, formatted for easy copy/paste into Obsidian or any other markdown-based note system:

🧪 AlmaLinux Lesson 1: SELinux Demo Review & Journal
Date: Wed, May 14, 2025
Focus: Understanding and testing SELinux enforcement via a real-world denial and resolution flow.

🔐 Goal
Simulate a basic SELinux access denial and walk through identifying, interpreting, and resolving it using proper tools (restorecon, ausearch, etc.).

✅ Steps Completed
1. Initial Checks
Confirmed SELinux was in Enforcing mode via:
getenforce
sestatus


2. Create a File with Incorrect SELinux Context
echo "Hello SELinux" > ~/selinux_test.html
sudo mv ~/selinux_test.html /var/www/html/
ls -Z /var/www/html/selinux_test.html

📝 Context showed user_home_t, which is not allowed to be read by Apache (httpd).

3. Attempt Access via Web Request
sudo systemctl start httpd
curl http://localhost/selinux_test.html

Result: 403 Forbidden — Apache couldn’t access the file.

4. Investigate the Denial
sudo ausearch -m avc -ts recent

AVC Denial Found:
avc:  denied  { read } for  pid=1980 comm="httpd" ... tcontext=user_home_t

SELinux denied Apache (httpd_t) access to a file labeled for user home content (user_home_t).

5. Fix the Label with restorecon
sudo restorecon -v /var/www/html/selinux_test.html

Context changed to:
httpd_sys_content_t


6. Retry Web Request
curl http://localhost/selinux_test.html

Success: Hello SELinux displayed.

🧠 Key Takeaways
SELinux enforces access based on labels, not just users and permissions.
Apache will only serve files labeled httpd_sys_content_t.
Use ausearch or grep to find denials in real-time.
restorecon safely resets file labels to their expected context.
SELinux is a powerful last line of defense in hardened systems.
Disabling SELinux isn’t the solution — understanding it is.

🧰 Commands Used (Reference)
getenforce
sestatus
ls -Z /path/to/file
sudo ausearch -m avc -ts recent
sudo restorecon -v /path/to/file
curl http://localhost/filename


🔄 Next Steps (Optional for Lesson 2)
Explore chcon and semanage fcontext to manually assign contexts.
Learn how to permanently label files during deployments.
Use firewalld and ss to check and control network services (next Wednesday topic).

Let me know if you want to save this into a Linux doc, GitHub repo, or workdocs site later — I can help convert it too.