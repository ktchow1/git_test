#!/bin/bash


#########################
### [1] Create a repo ###
#########################
pushd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null 
cd ..

rm -rf dev
rm -rf dev0
rm -rf dev1
rm -rf shared
mkdir dev
cd dev
git init

echo AAA > A.txt; git add A.txt; git commit -m "add A"; 
echo BBB > B.txt; git add B.txt; git commit -m "add B";
echo CCC > C.txt; git add C.txt; git commit -m "add C"; 
git branch temp0
git branch temp1
git branch temp2

echo DDD > D.txt; git add D.txt; git commit -m "add D";
echo EEE > E.txt; git add E.txt; git commit -m "add E"; 
echo FFF > F.txt; git add F.txt; git commit -m "add F"; 
echo ""
git log --oneline --decorate --all --graph
echo ""



#################
### [2] Merge ###
#################
git checkout temp0
echo EEE > E.txt; git add E.txt; git commit -m "add E0"; 
echo FFF > F.txt; git add F.txt; git commit -m "add F0"; 
echo GGG > G.txt; git add G.txt; git commit -m "add G0"; 

### Auto resolve (simply add comment for commit) ###
git checkout master
git merge temp0 
echo ""
git log --oneline --decorate --all --graph
echo ""


###############################
### [3] Merge with conflict ###
###############################
git checkout temp1
echo EXX > E.txt; git add E.txt; git commit -m "add E1"; 
echo FFF > F.txt; git add F.txt; git commit -m "add F1"; 
echo HHH > H.txt; git add H.txt; git commit -m "add H1"; 

git checkout master
git merge temp1 
echo ""
git log --oneline --decorate --all --graph
echo ""

### Manual resolve ###
echo "Conflicts detected, need manual resolve ..."
echo EYY > E.txt; git add E.txt; git commit -m "manual resolve conflict in E.txt"
echo ""
git log --oneline --decorate --all --graph
echo ""


################################
### [4] Rebase with conflict ###
################################
echo ""
echo "master snapshot"
cat *
echo ""

git checkout temp2
echo D---- > D.txt; git add D.txt; git commit -m "add D2"; 
echo E---- > E.txt; git add E.txt; git commit -m "add E2"; 
echo F---- > F.txt; git add F.txt; git commit -m "add F2"; 

echo ""
echo "temp2 snapshot"
cat *
echo ""

git checkout master
git rebase temp2 
echo ""
git log --oneline --decorate --all --graph
echo ""

# echo answer > file.txt
# git add file.txt
# git rebase --continue




### The END ###
popd &> /dev/null 


