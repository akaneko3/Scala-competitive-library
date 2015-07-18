#!/bin/sh

TEMPLATEDIR=`dirname $0`
PWD=`pwd`

P1=`realpath $TEMPLATEDIR`
P2=`realpath $PWD`
if [ $P1 = $P2 ] ; then
    echo "DO NOT exec copy.sh in template directory"
    exit 1
fi

cp -r $TEMPLATEDIR/* $PWD
rm -r $PWD/project
rm -r $PWD/target
rm -r $PWD/copy.sh
find  $PWD/src/test/scala -type f | grep -v -E "MainTest.scala" | xargs rm

exit 0