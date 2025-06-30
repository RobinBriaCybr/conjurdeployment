#!/bin/bash

# IMPORT: Basic Script to import SSL certificate for Conjur Leader Server

# Global Variables
source variable.sh
certDir="/home/ec2-user/ca"
archive="certBundle.tar"

# Change working directory
cd $certDir

# Create archive file for SSL certificates
tar -cf $archive myCA.pem master.key master.pem follower.key follower.pem conjur-follower-dc.cyberark.svc.cluster.local.key conjur-follower-dc.cyberark.svc.cluster.local.pem

# Import SSL certificates to Conjur leader Server
docker cp $archive $container:/tmp/
docker exec $container tar -xf /tmp/$archive

#Import Root CA concatain
docker exec $container evoke ca import --force --root myCA.pem

#Import Follower CA
docker exec $container evoke ca import --key follower.key follower.pem
docker exec $container evoke ca import --key conjur-follower-dc.cyberark.svc.cluster.local.key conjur-follower-dc.cyberark.svc.cluster.local.pem

#Import leader CA
docker exec $container evoke ca import --force --key master.key --set master.pem
