# GIT \| Create a new Branch with no history

this creates a `<NEW_BRANCH_NAME>` from the current branch, with the last commit as the only commit. \(no history\)

```
git branch <NEW_BRANCH_NAME> $(echo "commit message" | git commit-tree HEAD^{tree})
```



