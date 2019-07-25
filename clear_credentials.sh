### This script is used to clear old user infor if you want to create a new user for mediawiki application 
# Once this is run again try to run the generate script

#!/bin/bash
yes|cp -rvf userdata/db.sh_bkp userdata/db.sh
