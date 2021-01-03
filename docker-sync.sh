#!/bin/bash 
set -u
set -x 

repo=$1
target=public.ecr.aws/e2x4u7r1

tags=$(./docker-remote-tags.sh $1)
for x in $tags; do 
    echo "+ Sync $repo:$x -> $target"
    while [ true ]; do 
        docker pull $repo:$x
        if [[ $? == '0' ]]; then
          break
        else 
          sleep 10
        fi
    done 
    docker tag $repo:$x $target/nextflow:$x
    docker push $target/nextflow:$x
    echo ""
done