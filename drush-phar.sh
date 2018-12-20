#!/bin/sh
# IMPORTANT. You must have wget and php installed
if ! type php > /dev/null; then
  echo "php is not installed. Abording." >&2;
  exit 1;
fi

if ! type wget > /dev/null; then
  echo "wget is not installed. Abording." >&2;
  exit 1;
fi

# Use Bash as command line (if you like you can use your own CL too!)
chsh -s "$(command -v bash)" "$USER"

# Enter Drush version (branch from Github)
# Notice that you need Drush 9.x (branch master) to be able to work with Drupal 8.x
echo -n "Please enter the Drush version (eg 8.1.18): "
read branch

# Create drush folder
mkdir ~/drush

# Download the files with wget. Get version from user input
wget https://github.com/drush-ops/drush/releases/download/"${branch}"/drush.phar --no-check-certificate

# Make it execurtable and move inside ~/drush folder
chmod u+x ~/drush.phar && mv ~/drush.phar ~/drush/drush

# Add alias to .bash_profile
echo "Adding drush and composer alias"
touch ~/.bash_profile
echo "alias drush='~/drush/drush'" > ~/.bash_profile

# Source the changed .bash_profile or restart ssh session
source ~/.bash_profile

echo "Drush phar installation finished! Run Drush to test it."
