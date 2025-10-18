#!/usr/bin/env python3
from pathlib import Path
import shutil
import logging
import subprocess
from datetime import datetime

# === CONFIGURATION ===
WATCH_DIR = Path.home() / "Downloads" /"test" # Change this if needed
LOG_FILE = Path("logs/automation.log")

# File categories by extension
FILE_CATEGORIES = {
    "PDFs": [".pdf"],
    "Images": [".jpg", ".jpeg", ".png", ".gif"],
    "Videos": [".mp4", ".mkv", ".avi"],
    "Documents": [".doc", ".docx", ".txt"],
    "Archives": [".zip", ".tar", ".gz", ".rar"],
}

# === LOGGING SETUP ===
logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def log_and_print(message):
    """Helper to log and print messages."""
    print(message)
    logging.info(message)

# === FUNCTIONS ===
def run_linux_command(cmd):
    """Run a Linux command and return its output."""
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout.strip()

def categorize_file(file_path):
    """Determine category based on file extension."""
    for category, extensions in FILE_CATEGORIES.items():
        if file_path.suffix.lower() in extensions:
            return category
    return "Others"

def organize_files():
    """Organize files in the WATCH_DIR."""
    if not WATCH_DIR.exists():
        log_and_print(f"ERROR: Directory {WATCH_DIR} does not exist!")
        return

    log_and_print(f"Starting organization in: {WATCH_DIR}")

    for item in WATCH_DIR.iterdir():
        if item.is_file():
            category = categorize_file(item)
            target_dir = WATCH_DIR / category
            target_dir.mkdir(exist_ok=True)
            
            try:
                shutil.move(str(item), str(target_dir / item.name))
                log_and_print(f"Moved: {item.name} → {target_dir}")
            except Exception as e:
                log_and_print(f"Failed to move {item.name}: {e}")

    log_and_print("Organization complete!\n")

def generate_report():
    """Run Linux commands to generate a report of the folder."""
    log_and_print("Folder Report:")
    log_and_print(run_linux_command(f"ls -lh {WATCH_DIR}"))
    log_and_print(run_linux_command(f"du -sh {WATCH_DIR}/*"))

# === MAIN ENTRY POINT ===
if __name__ == "__main__":
    log_and_print("==== FILE ORGANIZER RUN START ====")
    organize_files()
    generate_report()
    log_and_print("==== RUN COMPLETE ====\n")
