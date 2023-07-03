#!/bin/bash

# Ask for email input
echo "Please enter your name for git configuration:"
read name

echo "Please enter your email for git configuration:"
read email

# Create .gitconfig file
cat > ~/.gitconfig << EOF
[user]
	name = $name
	email = $email
EOF

# Verify the operation
echo ".gitconfig file has been created with the following contents:"

# Display the content
cat ~/.gitconfig
