#!/bin/bash

# INSTALL: Basic Script to Generate Standby Seed

# Global Variables
source variable.sh
serverType="standby"

# Copy Seed Archive to Docker Host (docker-host1)
echo "Copy seed archive to Docker Host: docker-host1"
echo "------------------------------------"
sudo podman exec $container evoke seed $serverType $standby1DNS $masterDNS > seed1
scp seed1 <user>@$standby1DNS:.



# Copy Seed Archive to Docker Host (docker-host2)
echo "Copy seed archive to Docker Host: docker-host2"
echo "------------------------------------"
sudo podman exec $container evoke seed $serverType $standby2DNS $masterDNS > seed2
scp seed2 <user>@$standby2DNS:.