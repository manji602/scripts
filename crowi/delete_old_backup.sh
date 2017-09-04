#!/bin/bash -eu

EXCLUDE_DATE=`date '+%Y%m%d'`
aws s3 rm $S3_PATH --exclude "*${EXCLUDE_DATE}*" --recursive --dryrun
