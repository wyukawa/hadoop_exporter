#!/bin/bash

# Upload file as release attachment using ghr.
# go get -u github.com/tcnksm/ghr
# https://github.com/tcnksm/ghr

RELEASE=$1
UPLOAD_FILE=$2
GH_FILE=$(basename $UPLOAD_FILE)

export GIT_REPO_URL=$(git config -l |awk -F'remote.origin.url=' '{print$2}' |grep -v ^$)
export GIT_USER=$(echo $GIT_REPO_URL |awk -F':' '{print$2}' |awk -F'/' '{print$1}')
export GIT_REPO=$(echo $GIT_REPO_URL |awk -F':' '{print$2}' |awk -F'/' '{print$2}' |sed 's/.git//')

ghr -u ${GIT_USER} -r ${GIT_REPO} \
    --replace "${RELEASE}" ${UPLOAD_FILE}
