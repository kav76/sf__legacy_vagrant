#!/bin/bash


# Update package list and upgrade all packages
apt-get update
apt-get -y upgrade

apt-get -y install postgresql postgresql-contrib


# Restart so that all new config is loaded:
service postgresql restart

