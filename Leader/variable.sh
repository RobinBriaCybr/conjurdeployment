#!/bin/bash

# CONFIGURE: Basic Script to configure DAP container as Master Server (dap1)

# Global Variables
container="conjur"
masterDNS=<LeaderDNS>
clusterDNS=<LeaderLoadBalancerDNS>
standby1DNS=<Standby1DNS>
standby2DNS=<Standby2DNS>
followerLB=<FollowerLoadBalancerDNS>
follower1DNS=<follower1DNS>
follower2DNS=<follower2DNS>
accountName="cybr"
clusterName="cybr"
version="12.7.0.1"  
registry="localhost"

