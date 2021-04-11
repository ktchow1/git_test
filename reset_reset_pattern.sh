#!/bin/bash


################
### [1] Init ###
################
pushd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null 
cd ..

rm -rf dev
rm -rf shared
mkdir dev
mkdir shared

cd shared 
git init --bare


########################################
### [2] Dev does something in master ###
########################################
cd ../dev
git init
git remote add origin ../shared

echo AAA > A.txt; git add A.txt; git commit -m "add A"; 
echo BBB > B.txt; git add B.txt; git commit -m "add B"; 
echo CCC > C.txt; git add C.txt; git commit -m "add C"; git branch dev
git push -u origin master
echo DDD > D.txt; git add D.txt; git commit -m "add D"; git branch temp 
echo EEE > E.txt; git add E.txt; git commit -m "add E"; 
echo FFF > F.txt; git add F.txt; git commit -m "add F"; 
git push 

git checkout dev
rm A.txt;         git add A.txt; git commit -m "rm A";
echo GGG > G.txt; git add G.txt; git commit -m "add G"; 
echo HHH > H.txt; git add H.txt; git commit -m "add H"; 
echo III > I.txt; git add I.txt; git commit -m "add I"; 
git push -u origin dev

echo ""
git log --oneline --decorate --all --graph
echo ""


##########################################
### [3] Dev switches to another branch ###
##########################################
echo ""; echo "****** Before reset-reset ******"; ls; echo ""
git checkout master; 
git reset --hard temp 
git reset --soft dev  
git commit -m "append temp to dev"
echo ""; echo "****** After reset-reset ******"; ls; echo ""

echo ""
git log --oneline --decorate --all --graph
echo ""
git push --force
echo ""
git log --oneline --decorate --all --graph

popd &> /dev/null 
