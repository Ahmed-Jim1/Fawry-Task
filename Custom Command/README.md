# 🛠️ Mini Grep Command — `mygrep.sh`

Welcome to my mini version of the famous `grep` command!  
This project replicates core functionalities of `grep` using a Bash script.

---

## 📋 Features

- **Case-insensitive search**: Find matching lines regardless of letter case.
- **Options supported**:
  - `-n` → Show line numbers with matches.
  - `-v` → Invert match (show non-matching lines).
  - Support for combinations like `-vn` and `-nv`.

- **Error Handling**:
  - Missing file or incorrect usage will display helpful messages.

- **Bonus**:
  - `--help` flag supported for easy usage guide.

---

## 📂 Test File

The script has been validated using a file named `testfile.txt` which is in this repo

---

## 🧪 Validation Steps

Here are the commands tested:

```bash
./mygrep.sh hello testfile.txt
./mygrep.sh -n hello testfile.txt
./mygrep.sh -vn hello testfile.txt
./mygrep.sh -v testfile.txt
```

---

 
## 🧠 Reflective Section

### 1. How the Script Handles Arguments and Options

- It first checks for the presence of the `--help` flag to display usage instructions.
- Parses the arguments manually to detect `-n`, `-v`, or combinations (`-vn`, `-nv`).
- After parsing options, it ensures both the search string and filename are provided.
- If options are detected, the script applies them properly using `grep`-like behavior with `awk`.

### 2. If I Were to Support Regex (`-E`) or More Options Like `-i`, `-c`, `-l`

- I would refactor the script to use `getopts` for more scalable and reliable option parsing.
- Add extra flags to `awk` commands or possibly use Bash's built-in regex capabilities.
- Modularize the script into reusable functions for better readability and maintainability.

### 3. Hardest Part

- The hardest part was managing the correct flow when both `-n` and `-v` were combined, ensuring the line number still displayed even for inverted matches.

---

## 📜 Usage

```bash
./mygrep.sh [OPTIONS] <search_string> <file_name>
```
## ⚙️ Options

- `-n` : Show line numbers with matches.
- `-v` : Invert the match (show non-matching lines).
- `-vn` / `-nv` : Both invert the match and show line numbers.
- `--help` : Show help message.

---

## 📸 Screenshots

./mygrep.sh hello testfile.txt 
![image](https://github.com/user-attachments/assets/becaf57c-4f10-4fef-b1b2-6b71ed57c706)
./mygrep.sh -n hello testfile.txt
![image](https://github.com/user-attachments/assets/943be2e7-cf13-4d6b-b6d1-5254060a2445)
./mygrep.sh -vn hello testfile.txt
![image](https://github.com/user-attachments/assets/5a12d72c-87e9-44aa-9d51-b89b460edb0e)
./mygrep.sh -v testfile.txt
![image](https://github.com/user-attachments/assets/0bcc8b1d-7dc8-4fa8-9bbf-3d6bf35fbc62)
./mygrep.sh --help
![image](https://github.com/user-attachments/assets/0a206344-ec24-4eae-8133-208c09606a6c)
  

 
 






