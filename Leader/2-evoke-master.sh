#!/bin/bash

# CONFIGURE: Basic Script to configure container as Leader Server

# Global Variables
source variable.sh
serverType="master"

echo -n "Type admin account password: ";
read -s adminPass;

# EVOKE: Execute evoke command to configure DAP container as Master Server
sudo podman exec $container evoke configure $serverType --accept-eula -h $clusterDNS --master-altnames "$masterDNS,$standby1DNS,$standby2DNS" -p $adminPass $accountName

