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


#########################################
### [2] Dev0 does something in master ###
#########################################
cd ../dev0
git init
echo AAA > A.txt; git add A.txt; git commit -m "add A"; 
echo BBB > B.txt; git add B.txt; git commit -m "add B"; 
echo CCC > C.txt; git add C.txt; git commit -m "add C"; 
git remote add origin ../shared
git push -u origin master



#########################################
### [3] Dev1 does something in master ###
#########################################
cd ../dev1
git init
git remote add origin ../shared
git fetch --all
git checkout master

echo DDD > D.txt; git add D.txt; git commit -m "add D"; 
echo EEE > E.txt; git add E.txt; git commit -m "add E"; 
echo FFF > F.txt; git add F.txt; git commit -m "add F"; 
git push 


######################################
### [4] Dev0 does something in dev ###
######################################
cd ../dev0
git checkout -b dev
echo GGG > G.txt; git add G.txt; git commit -m "add G"; 
echo HHH > H.txt; git add H.txt; git commit -m "add H"; 
echo III > I.txt; git add I.txt; git commit -m "add I"; git branch d0 
echo JJJ > J.txt; git add J.txt; git commit -m "add J"; 
echo KKK > K.txt; git add K.txt; git commit -m "add K"; 
echo LLL > L.txt; git add L.txt; git commit -m "add L"; git branch d1 
echo MMM > M.txt; git add M.txt; git commit -m "add M"; 
echo NNN > N.txt; git add N.txt; git commit -m "add N"; 
echo OOO > O.txt; git add O.txt; git commit -m "add O"; git branch d2 

git fetch --all
git checkout master
git pull --rebase origin master;     

### GHI ###
git branch m0
git rebase d0;                               echo ""; echo "****** rebase d0 ******"
git log --oneline --decorate --all --graph;  echo ""

git reset --soft m0;                         echo ""; echo "****** reset m0 ******"
git log --oneline --decorate --all --graph;  echo ""
git commit -m "add GHI"

### JKL ###
git branch m1
git rebase d1;                               echo ""; echo "****** rebase d1 ******"
git log --oneline --decorate --all --graph;  echo ""

git reset --soft m1;                         echo ""; echo "****** reset m1 ******"
git log --oneline --decorate --all --graph;  echo ""
git commit -m "add JKL"

### MNO ###
git branch m2
git rebase d2;                               echo ""; echo "****** rebase d2 ******"
git log --oneline --decorate --all --graph;  echo ""

git reset --soft m2;                         echo ""; echo "****** reset m2 ******"
git log --oneline --decorate --all --graph;  echo ""
git commit -m "add JKL"

### Verify ###
git push
cd ../dev1

git fetch --all
git pull origin master;                      echo ""; echo "******* dev1 fetch ******"
git log --oneline --decorate --all --graph;  echo ""

ll
git checkout HEAD^
ll
git checkout HEAD^
ll
git checkout HEAD^
ll
popd &> /dev/null 
