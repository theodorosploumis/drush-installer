#!/bin/bash -e
# IMPORTANT. You must have curl, git and php installed. Also "$which git" must not be empty.

# Use Bash as command line (if you like you can use your own CL too!)
chsh -s $(which bash) $USER

# Enter Drush version (branch from Github)
echo -n "Please enter the Drush version (eg 6.x): "
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
php ~/bin/composer.phar install

# Add alias to .bash_profile
echo "Adding git alias"
touch ~/.bashrc
echo "alias drush='~/drush/drush'" > ~/.bashrc

# Source the changed .bash_profile or restart ssh session
source ~/.bashrc

echo "Drush installation finished! Run Drush to test it."
