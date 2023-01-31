#!/bin/bash

TAG=awx-netbox-ee
REGISTRY=localhost:30332
REGISTRY_USER=$USER

# really stupid but it prevents us having to search for ansible-builder
BUILDDIR=$(dirname $(find . -type f  -name "ansible-builder" -print))

# test if a python venv is setup, otherwise use the Dockerfile to run ansible-builder
if test -r "$BUILDDIR/activate" && test -x "$BUILDDIR/ansible-builder"; then
    source $BUILDDIR/activate
    ansible-builder build --tag=$TAG
else
    docker build -t rfdrake/ansible-builder .
    docker run --rm -v $PWD:/builder -v /var/run/docker.sock:/var/run/docker.sock -i rfdrake/ansible-builder build --tag=$TAG
fi
docker tag $TAG $REGISTRY/$TAG
docker login -u $REGISTRY_USER https://$REGISTRY
docker push $REGISTRY/$TAG
