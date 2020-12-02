# GIT - URL rewrite (https -> ssh)

The git config can be configured to rewrite any `https://...` urls to `ssh://git@...`

Add the following lines to your `~/.gitconfig`
```bash
[url "ssh://git@github.com/"]
        insteadOf = https://github.com/
```
