#!/bin/bash
if [ $(dpkg-query -W -f='${Status}' npm 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
  sudo apt install  nodejs
fi
