#!/bin/bash -e

BATTLESTATION_POWERUP_DIR="/tmp/ansible-master"
BATTLESTATION_POWERUP_ZIP="$BATTLESTATION_POWERUP_DIR.zip"
MODULE_DIR="./modules"

# Here we go...ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "\n\033[0;32m>>> Pre-install cleanup\033[0m"
if [ -d $BATTLESTATION_POWERUP_ZIP ]; then
    rm -f $BATTLESTATION_POWERUP_ZIP
fi
if [ -d $BATTLESTATION_POWERUP_DIR ]; then
    rm -rf $BATTLESTATION_POWERUP_DIR
fi

echo "\n\033[0;32m>>> Download battlestation-powerup\033[0m"
curl -Lo "$BATTLESTATION_POWERUP_ZIP" https://github.com/andrewtchin/ansible/archive/master.zip
unzip "$BATTLESTATION_POWERUP_ZIP" -d /tmp

cd $BATTLESTATION_POWERUP_DIR

echo "\n\033[0;32m>>> Install Xcode\033[0m"
# sudo ./scripts/xcode-cli-tools.sh

echo "\n\033[0;32m>>> Install Ansible\033[0m"
# sudo ./scripts/ansible-easy-install.sh

echo "\n\033[0;32m>>> Install Preinstall requirements\033[0m"
ansible-playbook --ask-sudo-pass -vvvv ./playbooks/osx-preinstall.yml

echo "\n\033[0;32m>>> Provision OS X\033[0m"
ansible-playbook --module-path=$MODULE_DIR --ask-sudo-pass -vvvv ./playbooks/osx.yml
