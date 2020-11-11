# GIT - autosign commits with GPG key

## Overview
This is a HowTo for setting up git for signing your commits auto-magic-ly with your GPG key.

## Prerequisite
* having a GPG-Key

## Do it
get GPG key ID
```bash
gpg --list-keys
```

set gpg programm for signing (optional)
```bash
git config --global gpg.program gpg2
```


set gpg key for signing
```bash
git config --global user.signingkey <GPG-KEY-ID>

e.g.
git config --global user.signingkey F2C7AB2
```

configure autosign
```bash
git config –-global commit.gpgsign true     # global - for all repos
git config commit.gpgsign true     # local - for the current repos
```

## Links
* https://docs.gitlab.com/ee/user/project/repository/gpg_signed_commits/
* https://help.github.com/articles/signing-commits/
* https://pbspro.atlassian.net/wiki/spaces/DG/pages/39419906/Signing+Your+Git+Commits
* https://developers.yubico.com/PGP/Git_signing.html