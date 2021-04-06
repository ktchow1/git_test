#!/bin/bash

###############################################################################
### [1] Regardless of current directory, goto parent folder of this script. ###
###############################################################################
pushd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null 
cd ..

rm -rf dev0
rm -rf dev1
rm -rf server
mkdir dev0
mkdir dev1
mkdir server

###############################
### [2] Build a binary tree ###
###############################
cd dev0
git init
echo AAA0 > A0.txt; git add A0.txt; git commit -m "add A0"; 
echo AAA1 > A1.txt; git add A1.txt; git commit -m "add A1";
echo AAA2 > A2.txt; git add A2.txt; git commit -m "add A2"; git branch   feature1
echo BBB0 > B0.txt; git add B0.txt; git commit -m "add B0";
echo BBB1 > B1.txt; git add B1.txt; git commit -m "add B1";
echo BBB2 > B2.txt; git add B2.txt; git commit -m "add B2"; git branch   feature0
echo DDD0 > D0.txt; git add D0.txt; git commit -m "add D0"; 
echo DDD1 > D1.txt; git add D1.txt; git commit -m "add D1";
echo DDD2 > D2.txt; git add D2.txt; git commit -m "add D2"; git checkout feature0
echo EEE0 > E0.txt; git add E0.txt; git commit -m "add E0"; 
echo EEE1 > E1.txt; git add E1.txt; git commit -m "add E1";
echo EEE2 > E2.txt; git add E2.txt; git commit -m "add E2"; git checkout feature1
echo CCC0 > C0.txt; git add C0.txt; git commit -m "add C0"; 
echo CCC1 > C1.txt; git add C1.txt; git commit -m "add C1";
echo CCC2 > C2.txt; git add C2.txt; git commit -m "add C2"; git branch   feature2
echo FFF0 > F0.txt; git add F0.txt; git commit -m "add F0"; 
echo FFF1 > F1.txt; git add F1.txt; git commit -m "add F1";
echo FFF2 > F2.txt; git add F2.txt; git commit -m "add F2"; git checkout feature2
echo GGG0 > G0.txt; git add G0.txt; git commit -m "add G0"; 
echo GGG1 > G1.txt; git add G1.txt; git commit -m "add G1"; 
echo GGG2 > G2.txt; git add G2.txt; git commit -m "add G2"; git branch 








popd &> /dev/null 
