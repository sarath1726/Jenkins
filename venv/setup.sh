#!/bin/bash
source /var/jenkins_home/workspace/My_test/venv/bin/activate  # Adjust the path as necessary

python -m ensurepip --upgrade  # Ensure pip is installed
pip install --upgrade pip  # Upgrade pip
pip install robotframework pytest  # Install required packages
pip list  # List installed packages to verify

