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
mkdir dev0
mkdir dev1
mkdir shared

cd shared 
git init --bare


###############################
### [2] Dev0 does something ###
###############################
cd ../dev0
git init
echo AAA > A.txt; git add A.txt; git commit -m "add A"; 
echo BBB > B.txt; git add B.txt; git commit -m "add B"; 
echo CCC > C.txt; git add C.txt; git commit -m "add C"; 
git remote add origin ../shared
git push -u origin master



###############################
### [3] Dev1 does something ###
###############################
cd ../dev1
git init
git remote add origin ../shared
git fetch
git checkout master
git checkout -b dev
git log --oneline --decorate --all --graph



