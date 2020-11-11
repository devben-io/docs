# GIT - Sync Fork from upstream Repo



#### Add the Remote Upstream Repository

```
git remote add upstream [Upstream git URL]
```

#### Fetch the Upstream Branches

```
git fetch upstream
```

#### Merge Upstream Changes into your Downstream Repository

```
git merge upstream/master
```

#### Create a New Branch for Work

```
git checkout -b "feature-new-stuff"
```

#### Perform Your Local Work

...

#### Push Changes to Your Downstream Remote Repository

```
git push origin feature-new-stuff
```

#### Repeat



## Links:

* [https://medium.com/sweetmeat/how-to-keep-a-downstream-git-repository-current-with-upstream-repository-changes-10b76fad6d97](https://medium.com/sweetmeat/how-to-keep-a-downstream-git-repository-current-with-upstream-repository-changes-10b76fad6d97)



