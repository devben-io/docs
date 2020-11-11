# GIT - Howto reset a single file

## Overview
This is a HowTo for resetting a single `<FILE>` to a point of time of a `<OLD-COMMIT>`-ID.

<!--more-->

## Prerequisite
* git
* _"know the commit IDs from `<OLD-COMMIT>` (& `<OTHER-COMMIT>`)"_

## Do it
Reset `<FILE>` in current branch w/ that file from `<OLD-COMMIT>`
```bash
# checkout file from <OLD-COMMIT> to current branch
$ git checkout <OLD-COMMIT> <PATH-TO>/<FILE>

# commit changes
$ git commit --all
```

```bash
# e.g.
$ git checkout e421d7e0b0018fe5ed53be80d4c6fe9ce1XXXXXX .buildkite/pipeline.yml
$ git commit --all
```

Reset `<FILE>` in `<OTHER-COMMIT>` with that one from `<OLD-COMMIT>`
```bash
# checkout file from <OLD-COMMIT> to current branch
$ git checkout <OLD-COMMIT> <PATH-TO>/<FILE>

# commit changes & select <OLD-COMMIT> to fixup
$ git commit --all --fixup=<OLD-COMMIT>

# interactive rebase
$ git rebase -i --autosquash master

# force changes
$ git push -f
```

```bash
# e.g.
$ git checkout e421d7e0b0018fe5ed53be80d4c6fe9ce1XXXXXX .buildkite/pipeline.yml
$ git commit --all --fixup=a3d684cc558f46bffa30018154e66d123XXXXXX
$ git rebase -i --autosquash master
$ git push -f
```



## Links
* https://stackoverflow.com/questions/692246/undo-working-copy-modifications-of-one-file-in-git