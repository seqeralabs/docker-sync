# Docker sync 

Copy all images from a Docker repository to another registry 


## Get started 

```
docker-sync.sh <SOURCE REPOSITORY> <TARGET REGISTRY>
```

For example 


```
docker-sync.sh nextflow/nextflow quay.io 
```

Copy all nextflow/nextflow images (ie tags) to [Quay.io](https://quay.io) registry.

