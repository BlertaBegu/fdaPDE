#!/bin/bash

IMAGE=rhub/debian-gcc-patched

docker pull $IMAGE 

docker run --name=tmp-debian-gcc -v $(pwd)/../../:/root/fdaPDE --rm -ti $IMAGE bin/bash -c '

export RGL_USE_NULL=TRUE
export DISPLAY=99.0
cd root/
ln -s /opt/R-patched/bin/R /usr/local/bin/R
ln -s /opt/R-patched/bin/Rscript /usr/local/bin/Rscript
apt-get install -y libgl1-mesa-dev libglu1-mesa-dev
 
Rscript fdaPDE/tests/building_check/check.R 

exit
'
