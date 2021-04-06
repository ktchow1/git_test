#!/bin/bash


###############################################################################
### [1] Regardless of current directory, goto parent folder of this script. ###
###############################################################################
pushd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null 
cd ..

rm -rf dev0
rm -rf dev1
rm -rf shared
mkdir dev0
mkdir dev1
mkdir shared


################################
### [2] Create a binary tree ###
################################
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
echo GGG2 > G2.txt; git add G2.txt; git commit -m "add G2"; git checkout master 
echo ""
echo "##############################"
echo "### Binary tree is created ###"
echo "##############################"
git log --oneline --decorate --all --graph
echo ""


##########################
### [3] Push to remote ###
##########################
cd ../shared 
git init --bare

cd ../dev0
git remote add origin ../shared

########################################################
# If upstream branch is not created, need to specify :
# 1. remote-site
# 2. branch name
# If upstream branch is created, then just :
# >> git push 
# is fine, it pushes HEAD branch to registered location.
########################################################
git push origin master 
git push -u origin feature0 
git push -u origin feature1 

echo ""
echo "#####################################"
echo "### Push to remote (see : origin) ###"
echo "#####################################"
git log --oneline --decorate --all --graph
echo ""
echo "--> Here are tracking branches ... -a"
git branch -a 
echo "--> Here are upstream branches ... -vv (-v is not enough)"
git branch -vv 
echo ""


#############################
### [4] Fetch from remote ###
#############################
cd ../dev1
git init
git remote add origin ../shared
git fetch --all

echo ""
echo "###########################################"
echo "### Fetch from remote                   ###"
echo "### (clone = init + remote add + fetch) ###"
echo "###########################################"
git log --oneline --decorate --all --graph
echo ""
echo "--> Here are tracking branches ... -a"
git branch -a 
echo "--> Here are upstream branches ... -vv (-v is not enough)"
git branch -vv 
echo ""



popd &> /dev/null 
