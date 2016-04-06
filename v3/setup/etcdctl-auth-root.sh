#!/bin/bash

source /etc/environment

HOMEDIR=$(eval echo "~`whoami`")

sudo docker run --rm \
    -v ${HOMEDIR}:/data/ behance/docker-aws-s3-downloader \
     us-east-1 $CONTROL_TIER_S3SECURE_BUCKET .etcdctl-auth-root


# it's expected that these fields are already in the form
# /KEY/NAMESPACE VALUE

# To edit the fields in .etcdctl-auth-root:
# 1) Download the current version of .marathon from S3: be-secure-<tier>/.etcdctl-auth-root
# 2) Edit this file locally
# 3) Verify changes with peers
# 4) Upload edited file back to S3: be-secure-tier/.etcdctl-auth-root
# 5) Restart zk-exhibitor fleet-units via jenkins for changes to take effect


while read line; do
    etcdctl set $line
done < ${HOMEDIR}/.etcdctl-auth-root
