#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding MRS ROS2 Stable PPA repository"

sudo apt-get -y install curl gpg dpkg-dev

ARCH=$(dpkg-architecture -qDEB_HOST_ARCH)

curl -s --compressed "https://ctu-mrs.github.io/ppa2-stable/ctu-mrs.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ctu-mrs.gpg >/dev/null
sudo curl -s --compressed -o /etc/apt/sources.list.d/ctu-mrs-stable.list "https://ctu-mrs.github.io/ppa2-stable/ctu-mrs-apt.list"
sudo curl -s --compressed -o /etc/apt/preferences.d/ctu-mrs-stable-preferences "https://ctu-mrs.github.io/ppa2-stable/ctu-mrs-ppa-preferences.txt"
sudo curl -s --compressed -o /etc/ros/rosdep/sources.list.d/ctu-mrs-stable.list "https://ctu-mrs.github.io/ppa2-stable/ctu-mrs-$ARCH.list"
sudo apt-get -y update

rosdep update

echo "$0: Finished adding MRS ROS2 Stable PPA repository"
