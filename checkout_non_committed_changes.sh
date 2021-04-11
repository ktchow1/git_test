#!/bin/bash


################
### [1] Init ###
################
pushd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null 
cd ..

rm -rf dev
rm -rf dev0
rm -rf dev1
rm -rf shared
mkdir dev


#########################################
### [2] Dev0 does something in master ###
#########################################
cd dev
git init
echo AAA > A.txt; git add A.txt; git commit -m "add A"; 
echo BBB > B.txt; git add B.txt; git commit -m "add B"; git branch dev 
echo CCC > C.txt; git add C.txt; git commit -m "add C"; 
echo DDD > D.txt; git add D.txt; git commit -m "add D";

git checkout dev
ls; cat *

git checkout master
echo aaa > A.txt;  rm B.txt;  rm C.txt; echo EEE > E.txt
ls; cat *   

git checkout dev 
ls; cat *

git checkout master 
ls; cat *



popd &> /dev/null 
