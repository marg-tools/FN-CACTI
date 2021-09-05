# FN-CACTI
CACTI for FinFETs and NC-FinFETs
1. Download the PCACTI source code from the link below under the PACKAGE - PCACTI
   https://sportlab.usc.edu/downloads/download/ 
2. Download the config_and_device_files.tgz from https://github.com/marg-tools/FN-CACTI
3. Download fncacti.patch from https://github.com/marg-tools/FN-CACTI
4. Download fncacti_patch.sh from https://github.com/marg-tools/FN-CACTI
5. Make sure all the downloaded files (config_and_device_files.tgz, fncacti.patch, fncacti_patch.sh, pcacti.tgz) are in same folder.
6. Invoke chmod +x fncacti_patch.sh to make the script executable
7. Run the script as: ./fncacti_patch.sh
8. A directory named fncacti is created which contains the patched CACTI code as well as compiled executable
9. Go into the fncacti directory: cd fncacti
10. Run an example of finfet and ncfet using the following instruction: 
   ./cacti -infile xmls/config_finfet.xml
   ./cacti -infile xmls/config_ncfet.xml
11. Follow README file in fncacti for more instructions.
