#!/bin/bash 
set -e
set -u
set -x 

repo=$1
target=public.ecr.aws/e2x4u7r1

tags=$(./docker-remote-tags.sh $1)
sleep 5
for x in $tags; do 
    echo "+ Sync $repo:$x -> $target"
    docker login
    docker pull $repo:$x
    docker tag $repo:$x $target/nextflow:$x
    ecr-login-public.sh
    docker push $target/nextflow:$x
    echo ""
    sleep 5
done