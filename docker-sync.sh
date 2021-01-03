#!/usr/bin/env bash
set -eou

repo=$1
target=$2

for x in $(./docker-remote-tags.sh $1); do 
    echo "+ Sync $repo:$x -> $target"
    docker pull $repo:$x
    docker tag $repo:$x $target/$repo:$x
    docker push $target/$repo:$x
    echo ""
done