# GIT - Rebase (squashing)



When branching off of master or development the changes need to be merged back into the original branch.

Let's say you based your changes on the development branch and then created your feature branch `feat/dockerize`:

```
git checkout develop
git checkout -b feat/dockerize
```

List the number of commits done on your feature branch (required for squashing them with rebase):

```
git rev-list --count HEAD ^develop
7
```

Then look at the git log to verify the number of commits starting from head that we went to combine into a single commit:

```
git log --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s"

328dd76  Mon Sep 3 15:04:01 2018 +0200 (23 minutes ago)  User 2: Update docker build steps
7362bfe  Mon Sep 3 14:00:02 2018 +0200 (87 minutes ago)  User 1: change README.dm
88e6aeb  Mon Sep 3 13:57:56 2018 +0200 (89 minutes ago)  User 1: change README.md
c0e059f  Mon Sep 3 13:49:58 2018 +0200 (2 hours ago)     User 1: "some" fixes :P
8b3f8fa  Mon Sep 3 13:17:47 2018 +0200 (2 hours ago)     User 1: fix login url
07da457  Mon Sep 3 13:09:56 2018 +0200 (2 hours ago)     User 1: fix "window.location.href"
a937e70  Mon Sep 3 10:18:58 2018 +0200 (5 hours ago)     User 1:  env created
5276ee2  Fri Aug 3 17:31:11 2018 +0200 (4 weeks ago)     User 3: enable cookie based sessions
e892cf4  Tue Jul 3 20:33:04 2018 +0200 (9 weeks ago)     User 3: sort reference chooser by LastModified DESC
8aeec86  Tue Jun 26 07:31:37 2018 +0200 (10 weeks ago)   User 3: added accept attribute to file uploads
```

Starting from HEAD (the last commit, index 0) we want to squash the commits HEAD-7:

```
git rebase -i HEAD~7

pick a937e70 env created
pick 07da457 fix "window.location.href"
pick 8b3f8fa fix login url
pick c0e059f "some" fixes :P
pick 88e6aeb change README.md
pick 7362bfe change README.dm
pick 328dd76 Update docker build steps

# Rebase 5276ee2..328dd76 onto 5276ee2 (7 commands)
#
# Commands:
# p, pick = use commit
# r, reword = use commit, but edit the commit message
# e, edit = use commit, but stop for amending
# s, squash = use commit, but meld into previous commit
# f, fixup = like "squash", but discard this commit's log message
# x, exec = run command (the rest of the line) using shell
# d, drop = remove commit
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

Change the lines from bottom to top:

```
r a937e70 env created
s 07da457 fix "window.location.href"
s 8b3f8fa fix login url
s c0e059f "some" fixes :P
s 88e6aeb change README.md
s 7362bfe change README.dm
s 328dd76 Update docker build steps
```

Change the commit message, save and clean up the rest of the commit messages.



(optional) rebase "back" to your Branch, you wanna merge to:
```bash
git rebase <MERGE-TO-BRANCH> <FEATURE-BRANCH>

# e.g.
git rebase master feature/awesome
```


Then forcely push the "new" feature-branch to server via:

```
git push --force
```



## Hacks

```bash
# select commits that should be squashed
git rebase -i HEAD~$(git rev-list --count HEAD ^master)

# rebase back to former branch e.g. "master"
git rebase master feature/<AWESOME-FEATURE>

# push changes, overwrites the history
git push --force
```

## Links
* https://github.com/servo/servo/wiki/Beginner's-guide-to-rebasing-and-squashing