#!/bin/bash
# Demo script to create and test a bash_profile

# Create a bash_profile file
echo "Creating ~/.bash_profile..."
cat > ~/.bash_profile << 'EOF'
# ~/.bash_profile - executed for login shells

# Set a unique environment variable to test
export LOGIN_SHELL_VAR="This variable is set by bash_profile"

# Print a message to show this file was sourced
echo "=== ~/.bash_profile has been loaded ==="

# Source .bashrc to ensure consistent settings
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
EOF

echo "~/.bash_profile created successfully!"
echo ""
echo "Let's test the difference between login and non-login shells:"
echo ""
echo "1. Testing a regular (non-login) shell:"
echo "   Opening a new bash instance..."
bash -c 'echo "  • LOGIN_SHELL_VAR: $LOGIN_SHELL_VAR"'
echo ""
echo "2. Testing a login shell:"
echo "   Opening a login shell with bash -l..."
bash -l -c 'echo "  • LOGIN_SHELL_VAR: $LOGIN_SHELL_VAR"'
echo ""
echo "What's happening:"
echo "- In the non-login shell, the variable is empty because ~/.bash_profile isn't read"
echo "- In the login shell (-l flag), the variable is set because ~/.bash_profile is read"
echo ""
echo "To test this in real usage:"
echo "- Regular terminal: Non-login shell (no ~/.bash_profile)"
echo "- SSH connection: Login shell (reads ~/.bash_profile)"
echo ""
echo "Demo complete! You now have a ~/.bash_profile file configured."