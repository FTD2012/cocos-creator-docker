#!/bin/sh

# ./build.sh -d ./lottery-casino-cdx-india

while getopts d:lb:ch OPT;do
    case $OPT in
        d)
            echo $OPTARG
            targetPath=$OPTARG
            ;;
        \?)
            exit 1
            ;;
    esac
done

Xvfb -ac -screen scrn 640x960x24 :9.0 &

export DISPLAY=:9.0

node $targetPath/packager/build_new.js
