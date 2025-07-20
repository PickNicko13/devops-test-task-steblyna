#!/bin/bash

# Define directory variables
LOG_DIR="logs"
OUTPUT_DIR="output"

# Function to create log directory and generate log file name
setup_logging() {
    local log_dir="$1"
    mkdir -p "$log_dir"
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    log_file="$log_dir/log-$timestamp.txt"
}

# Function to count regular files in specified directory
count_files() {
    local dir="$1"
    if [[ -d "$dir" ]]; then
        find "$dir" -maxdepth 1 -type f -not -path "$LOG_DIR/*" -print0 | tr -cd '\0' | wc -c
    else
        echo "0"
    fi
}

# Function to print and log messages
log_output() {
    local message="$1"
    echo "$message" | tee -a "$log_file"
}

# Main function
main() {
    setup_logging "$LOG_DIR"
    log_output "Hello from Bash!"
    log_output "Date: $(date)"
    log_output "FilesCount: $(count_files "$OUTPUT_DIR")"
}

# Execute main function
main

