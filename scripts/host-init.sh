#!/usr/bin/env bash
set -e

echo "HOST INSTALL: `hostname` updating packages"
# sudo yum update -y
sudo yum install -y python3-pip cloud-utils-growpart
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade setuptools

DEV=`sudo cat /etc/mtab  | grep " / xfs" | awk '{print $1}'`
DISK=${DEV%?}
PART=${DEV: -1}
if [[ `df -h | grep $DEV | awk '{print $2}' | awk -F 'G' '{ print $1 }'` > 300 ]]; then
    echo "Partition size is ok"
else
    echo "Need to grow root partition"
    sudo growpart $DISK $PART
    sudo xfs_growfs /
fi

echo "HOST INSTALL: `hostname` finished updates"
