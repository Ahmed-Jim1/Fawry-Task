![image](https://github.com/user-attachments/assets/4d3c3680-3632-4da6-a64a-8620e6c2c6d8)

# 🚀 Fawry Internship Task 

Welcome!  
This repository contains my solution for the **Fawry Internship Task**.  
I focused on clean code, clear documentation, and best practices to deliver a high-quality result.  
Feel free to explore the Task, and I’m excited to hear your feedback!

---

## 🛠️ Tech Stack

- **Language:** Bash 
- **Tools:** Linux, Git
- **Cloud:** AWS EC2

---
## Task 1 ( Custom Command )

This task is a **Bash scripting exercise** aimed at replicating the core functionalities of the `grep` command.  
The goal was to create a lightweight script named `mygrep.sh` that can:

- Search for a specific string inside a file.
- Support optional flags like:
  - `-n` to display line numbers alongside matching lines.
  - `-v` to invert the match and show non-matching lines.
  - Combined options like `-vn` or `-nv`.
- Provide helpful usage instructions with a `--help` flag.
- Handle errors gracefully, such as missing files or arguments.

The script manually parses command-line arguments without using advanced tools like `getopts`, making it an excellent learning experience for handling flags and inputs at a basic level.

---

Through this task, I practiced and strengthened my skills in:

- Bash scripting
- Argument parsing
- String matching and manipulation
- File reading and error handling
- Building user-friendly CLI tools

This mini-project not only simulated how powerful command-line utilities work under the hood, but also gave me a deeper appreciation of shell scripting techniques.
---
## Task 2 ( Scenario )

This task simulates troubleshooting a DNS and network connectivity issue for an internal web dashboard (`internal.example.com`).  
The service was reported as "up," but users received "host not found" errors, indicating a DNS resolution problem.

The task involves:

- **Verifying DNS resolution** using both the system's configured DNS servers and public DNS servers (like 8.8.8.8).
- **Diagnosing service reachability** by checking if the web service is accessible over HTTP (port 80) or HTTPS (port 443).
- **Identifying all possible causes** at both the DNS and network layers that could lead to connectivity failures.
- **Proposing and applying fixes** for each identified issue, using Linux troubleshooting commands.

### 🎯 Bonus steps:
- **Bypassing DNS temporarily** using the `/etc/hosts` file.
- **Configuring persistent DNS settings** using `systemd-resolved` or `NetworkManager`.

This exercise strengthens practical troubleshooting skills and demonstrates the full workflow of diagnosing, isolating, and resolving a real-world DevOps incident.


