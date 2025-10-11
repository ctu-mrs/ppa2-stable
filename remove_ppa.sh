#!/bin/bash

echo "$0: Removing MRS ROS2 Stable PPA repository"

sudo rm /etc/apt/sources.list.d/ctu-mrs-stable.list
sudo rm /etc/apt/preferences.d/ctu-mrs-stable-preferences
sudo rm /etc/ros/rosdep/sources.list.d/ctu-mrs-stable.list

sudo apt-get -y update
rosdep update

echo "$0: Finished removing MRS ROS2 Stable PPA repository"
