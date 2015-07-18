# Drush installer
A shell script to install [Drush](https://github.com/drush-ops/drush) on shared hosting environment.

## Installation
Login into the server (with ssh) and then run the installer. Then follow the installer steps and select your preferences.

Althout script already is sourcing the new command alias on ~/.bashrc it will not work. So, you have to source this file again manually.
`$ source ~/.bashrc`

### With git (server has git and permission to access github)
`
$ cd;wget https://raw.githubusercontent.com/theodorosploumis/drush-installer/master/drush-with-git.sh;bash drush-with-git.sh
`

### Without git
`
$ cd;wget https://raw.githubusercontent.com/theodorosploumis/drush-installer/master/drush-no-git.sh;bash drush-no-git.sh
`

## Known issues
- [Composer Update Fails due to Github Authorization](https://github.com/composer/composer/issues/3542)
- [Permission denied (publickey). fatal: Could not read from remote repository.](http://stackoverflow.com/q/12940626/1365264)
