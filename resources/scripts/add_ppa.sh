#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

echo "$0: Adding MRS ROS2 Stable PPA repository"

sudo apt-get --no-install-recommends -o Acquire::Retries="4" -y install curl gpg dpkg-dev python3-rosdep

if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
  sudo rosdep init
fi

ARCH=$(dpkg-architecture -qDEB_HOST_ARCH)
sudo curl -s --compressed --retry 4 --retry-max-time 60 --retry-all-errors -o /etc/ros/rosdep/sources.list.d/ctu-mrs-stable.list "https://ctu-mrs.github.io/ppa2-stable/ctu-mrs-$ARCH.list"
curl -s --compressed --retry 4 --retry-max-time 60 --retry-all-errors https://ctu-mrs.github.io/ppa2-stable/add_sources_ppa.sh | bash
rosdep update

echo "$0: Finished adding MRS ROS2 Stable PPA repository"
