# INSTALL: Basic Script to enroll nodes on th cluster



# Global Variables
source variable.sh

# enroll master
sudo podman exec $container evoke cluster enroll -n $standby1DNS -m $masterDNS $clusterName
