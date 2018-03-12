#!/bin/sh
cd $TRAVIS_BUILD_DIR

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis"
git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/${GH_USER}/${GH_REPO}.git gh-pages > /dev/null

cd gh-pages
cp -Rf $TRAVIS_BUILD_DIR/_book/* .   

git add -f .
git commit -m "Travis build $TRAVIS_BUILD_NUMBER"
git push -fq origin gh-pages > /dev/null
