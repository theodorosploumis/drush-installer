#!/bin/sh
# IMPORTANT. You must have curl, git and php installed
if ! type php > /dev/null; then
  echo "php is not installed. Abording." >&2;
  exit 1;
fi

if ! type curl > /dev/null; then
  echo "curl is not installed. Abording." >&2;
  exit 1;
fi

if ! type git > /dev/null; then
  echo "git is not installed. Abording." >&2;
  exit 1;
fi

# Use Bash as command line (if you like you can use your own CL too!)
chsh -s "$(command -v bash)" "$USER"

# Enter Drush version (branch from Github)
echo -n "Please enter the Drush version (eg 7.x): "
read branch

# Install Composer
echo "Installing Composer"
mkdir ~/bin
curl -sS https://getcomposer.org/installer | php -- --install-dir=bin

# Download Drush files (in our home folder)
# Git method (recommended)
echo "Cloning Drush from Github"
cd ~
git clone git@github.com:drush-ops/drush.git
cd ~/drush
git checkout ${branch}

# Make the drush folder executable by current USER
echo "Making the drush folder executable by current USER"
chmod u+x ~/drush/drush

# Install Drush from Composer
echo "Compile Drush with Composer"
cd ~/drush
php ~/bin/composer.phar update
php ~/bin/composer.phar install

# Add alias to .bash_profile
echo "Adding drush and composer alias"
touch ~/.bashrc
echo "alias composer='php ~/bin/composer.phar'" > ~/.bashrc
echo "alias drush='~/drush/drush'" > ~/.bashrc

# Source the changed .bash_profile or restart ssh session
source ~/.bashrc

echo "Drush installation finished! Run Drush to test it."
