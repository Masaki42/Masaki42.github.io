#!/bin/bash
 
# Go to blog's DIR
cd ~/Masaki42
 
# Create a new branch, run jekyll
git checkout -b src
jekyll build
 
# Make some temp directories and save the compiled site to the temp dir
rm -rf ~/tmp/Masaki42
mkdir -p ~/tmp/Masaki42
cp -R _site ~/tmp/Masaki42/_site
 
# Switch to master
git checkout master
 
# Save off the git stuff into a temp folder
mv .git ~/tmp/Masaki42/.git
mv .gitignore ~/tmp/Masaki42/.gitignore
 
# Remove everything else
rm -rf ./*
 
# Move stored files back
mv ~/tmp/Masaki42/.git .git
mv ~/tmp/Masaki42/.gitignore .gitignore
mv ~/tmp/Masaki42/_site/* .
 
# Create the blank file to tell GitHub not to jekyll compile
touch .nojekyll
 
# Commit to the repo
git add .
git add -u
git commit -m "Site updated and generated"
 
# Push to GitHub
git push
 
# Go back to src like you were never there
git checkout src
