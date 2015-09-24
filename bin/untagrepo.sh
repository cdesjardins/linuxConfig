#!/bin/bash

VERSION=$1
if [ -z "$VERSION" ] ; then
    echo "Version required"
elif [ ! -d .repo ] ; then
    echo "No .repo directory"
else
    repo forall -c git tag -d $VERSION
    repo forall -c git push --delete origin $VERSION
    pushd .
    cd .repo/manifests/
    git push origin :$VERSION
    popd
fi    

