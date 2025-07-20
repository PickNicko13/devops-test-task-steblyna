#!/bin/bash

# Define directory variables
LOG_DIR="logs"
OUTPUT_DIR="output"
HISTORY_FILE="$LOG_DIR/history.txt"

# Function to create log directory and generate log file name
setup_logging() {
    local log_dir="$1"
    local custom_log="$2"
    local timestamp="$3"
    mkdir -p "$log_dir"
    if [ -n "$custom_log" ]; then
        log_file="$log_dir/$custom_log"
    else
       # local timestamp=$(date +"%Y%m%d_%H%M%S")
	log_file="$log_dir/log-$(date --date=@$timestamp +"%Y%m%d_%H%M%S").txt"
    fi
    echo "$log_file"
    # Append execution record to history.txt
    local execution_time=$(date --date=@$timestamp '+%Y-%m-%d %H:%M:%S')
    echo "[$execution_time] Log file: $log_file" >> "$HISTORY_FILE"
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
    local timestamp=$(date +"%s")
    setup_logging "$LOG_DIR" "$1" "$timestamp"
    log_output "Hello from Bash!"
    log_output "Date: $(date --date=@$timestamp)"
    log_output "FilesCount: $(count_files "$OUTPUT_DIR")"
}

# Execute main function with provided argument
main "$1"
