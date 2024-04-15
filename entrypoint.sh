#!/bin/bash -x

echo ${GITHUB_REF#refs/heads/}
echo ${GITHUB_SHA::7}
echo ${GITHUB_REF#refs/*/}

REF=${GITHUB_REF#refs/heads/}
COMMIT_ID=${GITHUB_SHA::7}

if [[ "$REF" == "development" ]]; then
    printf "Branch name: $REF \nCommit ID: $COMMIT_ID"
    echo "RELEASE_VERSION=$COMMIT_ID" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=development" >> $GITHUB_ENV

elif [[ "$REF" == "develop" ]]; then
    printf "Branch name: $REF \nCommit ID: $COMMIT_ID"
    echo "RELEASE_VERSION=$COMMIT_ID" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=develop" >> $GITHUB_ENV

elif [[ "$REF" == "main" ]]; then
    printf "Branch name: $REF \nCommit ID: $COMMIT_ID"
    echo "RELEASE_VERSION=$COMMIT_ID" >> $GITHUB_ENV
    echo "GITOPS_BRANCH=main" >> $GITHUB_ENV

fi