# GIT \| Rebase \(squashing\)

When branching off of master or development the changes need to be merged back into the original branch.

Let's say you based your changes on the development branch and then created your feature branch `feat/dockerize`:

```
git checkout develop
git checkout -b feat/dockerize
```

List the number of commits done on your feature branch \(required for squashing them with rebase\):

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



