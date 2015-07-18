#!/bin/sh
# IMPORTANT. You must have curl, wget and php phar extension installed
if command -v php >/dev/null 2>&1
  echo "php is not installed. Abording." >&2;
  exit 1;
fi

if command -v curl >/dev/null 2>&1
  echo "curl is not installed. Abording." >&2;
  exit 1;
fi

if command -v testing >/dev/null 2>&1
  echo "testing is not installed. Abording." >&2;
  exit 1;
fi

# Use Bash as command line (if you like you can use your own CL too!)
chsh -s $(which bash) $USER

# Enter Drush version (branch from Github)
# Notice that you need Drush 7.x (branch master) to be able to work with Drupal 8.x
echo -n "Please enter the Drush version (eg 6.x): "
read branch

# Install Composer
mkdir ~/bin
curl -sS https://getcomposer.org/installer | php -- --install-dir=bin

# Download the files with wget. Get version from user input
wget https://github.com/drush-ops/drush/archive/${branch}.tar.gz --no-check-certificate

# Untar it and rename the folder to /drush
tar -zxvf ${branch}.tar.gz
rm ${branch}.tar.gz
mv ~/drush-${branch} ~/drush

# Make the drush folder executable by current USER
chmod u+x ~/drush/drush

# Install Drush from Composer
cd ~/drush
php ~/bin/composer.phar install

# Add alias to .bashrc
touch ~/.bashrc
echo "alias drush='~/drush/drush'" > ~/.bashrc

# Source the changed .bash_profile or restart ssh session
source ~/.bashrc

# Exit and test
echo "Drush installation finished! Run Drush to test it."
