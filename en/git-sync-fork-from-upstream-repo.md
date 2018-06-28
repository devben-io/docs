# GIT \| Sync Fork from upstream Repo

#### Add the Remote Upstream Repository

```
git remote add upstream [Upstream git URL]
```

#### Fetch the Upstream Branches {#bf46}

```
git fetch upstream
```

#### Merge Upstream Changes into your Downstream Repository {#ac09}

```
git merge upstream/master
```

#### Create a New Branch for Work {#e236}

```
git checkout -b "feature-new-stuff"
```

#### Perform Your Local Work {#c5f0}

...

#### Push Changes to Your Downstream Remote Repository {#415b}

```
git push origin feature-new-stuff
```





## Links:

* [https://medium.com/sweetmeat/how-to-keep-a-downstream-git-repository-current-with-upstream-repository-changes-10b76fad6d97](https://medium.com/sweetmeat/how-to-keep-a-downstream-git-repository-current-with-upstream-repository-changes-10b76fad6d97)



