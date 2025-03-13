#!/bin/sh
#

mkdir temp_extract && unzip mypatch.zip -d temp_extract
cp -r temp_extract/*/* . && rm -rf temp_extract/
