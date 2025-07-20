# DevOps Test Task

[![Run Hello Script](https://github.com/PickNicko13/devops-test-task-steblyna/actions/workflows/run-script.yml/badge.svg)](https://github.com/PickNicko13/devops-test-task-steblyna/actions/workflows/run-script.yml)

## Overview
This repository contains a DevOps test task implementing a bash script and a GitHub Actions workflow. The `scripts/hello.sh` script:
- Prints a greeting message ("Hello from Bash!").
- Outputs the current date and time.
- Counts regular files in the `output/` directory.
- Logs all output to a timestamped file in the `logs/` directory.

The GitHub Actions workflow (`run-script.yml`) automates script execution, validates the log file, and uploads it as an artifact. The workflow triggers on pushes and pull requests to the `master` branch, as well as manually via `workflow_dispatch`.

## Directory Structure
```
.
├── scripts/
│   └── hello.sh        # Bash script with the main functionality
├── logs/              # Directory for log files
├── output/            # Directory for output files
├── README.md          # This file
└── .github/
    └── workflows/
        └── run-script.yml  # GitHub Actions workflow
```

## Running the Script Locally
1. Clone the repository:
   ```bash
   git clone https://github.com/PickNicko13/devops-test-task-steblyna.git
   cd devops-test-task-steblyna
   ```
2. Ensure the script is executable:
   ```bash
   chmod +x scripts/hello.sh
   ```
3. Run the script:
   ```bash
   ./scripts/hello.sh
   ```
   To specify a custom log filename:
   ```bash
   ./scripts/hello.sh custom_log.txt
   ```
4. Check the output in the terminal and the generated log file in the `logs/` directory.

## Triggering the GitHub Actions Workflow Manually
1. Navigate to the repository on GitHub: `https://github.com/PickNicko13/devops-test-task-steblyna`.
2. Go to the **Actions** tab.
3. Select the **Run Hello Script** workflow from the list on the left.
4. Click the **Run workflow** button on the right.
5. Optionally, provide a custom log filename in the `log_filename` field (e.g., `mylog.txt`). Leave it empty to use a timestamped filename.
6. Click **Run workflow**.
7. Monitor the workflow progress in the Actions tab. Once completed, download the log file artifact from the workflow run's summary page.
