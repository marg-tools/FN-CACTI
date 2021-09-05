#!/bin/sh

# remove pcacti_xml directory if it is already existing
out_directory="pcacti_xml"
if [ -d $out_directory ] ; then
    rm -rf $out_directory
fi

config_directory="config_and_device_files"
if [ -d $config_directory ] ; then
    rm -rf $config_directory
fi

# Extract pcacti files from downloaded zip file
tar -xvzf pcacti.tgz
tar -xvf config_and_device_files.tgz

mv pcacti_xml fncacti

cd fncacti

# -p n : strip the smallest prefix containing n number of slashes 
# you can do a dry run by adding --dry-run 
# or use a backup of the file before it gets patched with -b

# patch -p1 --dry-run < ../fncacti.patch

patch -p1 < ../fncacti.patch

# remove config files provided by pcacti as the fncacti config files have a different format
rm xmls/cache_config_cmos.xml
rm xmls/cache_config_finfet.xml
rm README
rm cache.cfg

# copy config_and_device_files at appropriate locations
cp  ../config_and_device_files/config_finfet.xml xmls/
cp  ../config_and_device_files/config_ncfet.xml xmls/

cp  ../config_and_device_files/new_finfet_std.xml xmls/devices/
cp  ../config_and_device_files/ncfet_std.xml xmls/devices/

cp  ../config_and_device_files/ncfet_sram_6T1.xml xmls/sram_cells/

cp ../config_and_device_files/README .

# Compiling 
make clean
make

# Running cache configurations
./cacti -infile xmls/config_finfet.xml
./cacti -infile xmls/config_ncfet.xml
