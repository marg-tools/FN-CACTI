#!/bin/sh

# remove pcacti_xml directory if it is already existing
out_directory="pcacti_xml"
if [ -d $out_directory ] ; then
    rm -rf $out_directory
fi

config_directory="configs"
if [ -d $config_directory ] ; then
    rm -rf $config_directory
fi

fncacti_directory="fncacti"
if [ -d $fncacti_directory ] ; then
    rm -rf $fncacti_directory
fi

# Extract pcacti files from downloaded zip file
tar -xvzf pcacti.tgz
tar -xvf configs.tgz

mv pcacti_xml fncacti

cd fncacti

# -p n : strip the smallest prefix containing n number of slashes 
# you can do a dry run by adding --dry-run 
# or use a backup of the file before it gets patched with -b

# patch -p1 --dry-run < ../fncacti.patch

patch -p1 < ../fncacti.patch

# remove config files provided by pcacti as the fncacti config files have a different format
rm -rf xmls
rm README
rm xmlParser.cc
rm xmlParser.h

# copy config_and_device_files at appropriate locations
mv  ../configs/ .

mv configs/README .

# Compiling 
make clean
make

# Running cache configurations
#./cacti -infile xmls/config_finfet.xml
#./cacti -infile xmls/config_ncfet.xml


