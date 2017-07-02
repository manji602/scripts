#!/bin/sh

DUMP_DIR=backup
CURRENT_TIMESTAMP=`date '+%Y%m%d_%H%M%S'`
DUMP_FILE_PREFIX=crowi-backup

mongodump -h localhost --out $DUMP_DIR
tar -zcvf $DUMP_FILE_PREFIX.$CURRENT_TIMESTAMP.tar.gz $DUMP_DIR
rm -r $DUMP_DIR
aws s3 cp $DUMP_FILE_PREFIX.$CURRENT_TIMESTAMP.tar.gz $S3_PATH
rm $DUMP_FILE_PREFIX.$CURRENT_TIMESTAMP.tar.gz
