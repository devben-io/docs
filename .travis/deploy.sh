#!/bin/sh
mkdir -p $HOME/_book
cp -R ../_book $HOME/_book
cd $HOME

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis"
git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/${GH_USER}/${GH_REPO}.git gh-pages > /dev/null

cd gh-pages
cp -Rf $HOME/_book/* .   

git add -f .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
git push -fq origin gh-pages > /dev/null
