# GIT - copy files from other branch

## Overview
This is a HowTo for copying files from a `<SOURCE-BRANCH>` into the current one.

## Prerequisite
* git

## Do it
checkout the `<CURRENT-BRANCH>` (where you wanna merge/copy the files to)
```bash
git checkout <CURRENT-BRANCH>

# e.g.
git checkout dev/something
```

copy the file from `<SOURCE-BRANCH>`
```bash
git checkout <SOURCE-BRANCH> <FILE1> <FILEn> <FOLDER1> <FOLDERn>

# e.g.
git checkout feature/awesome variables.tf
```

now the `variables.tf`-file in the `dev/something`-branch is exchanged with the one from `feature/awesome`-branch


## Links
* https://stackoverflow.com/questions/10784523/how-do-i-merge-changes-to-a-single-file-rather-than-merging-commits/11593308