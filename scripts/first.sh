#!/bin/bash

# Function to check for errors
check_error() {
    if [ $? -ne 0 ]; then
        echo "An error occurred: $1"
        exit 1
    fi
}

# Function to handle the output from xcode-select
handle_xcode_select_output() {
    if [[ "$1" == *"already installed"* ]]; then
        echo "Xcode Command Line Tools are already installed. Skipping this step."
    else
        check_error "Xcode Command Line Tools installation failed"
    fi
}

echo "Installing Xcode Command Line Tools..."
output=$(sudo xcode-select --install 2>&1)
handle_xcode_select_output "$output"

echo "Installing Homebrew..."
# Using non-interactive installation for Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
check_error "Homebrew installation failed"

echo "Updating Homebrew..."
brew update
check_error "Homebrew update failed"

echo "Installing cask Ansible..."
brew install cask
brew install ansible
check_error "cask Ansible installation failed"

echo "Installation completed successfully!"
