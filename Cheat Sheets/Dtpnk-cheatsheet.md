# dtpnk's Cheatsheet

## git

```bash
## Oneliner: commit and squash changes into last commit, rebase to master & push changes
git commit --fixup=$(git --no-pager log --format="%H" -n 1) && git rebase -i --autosquash master && git push -f


```

## Kubernetes



## Links
* 