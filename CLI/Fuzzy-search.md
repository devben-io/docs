# CLI - fuzzy finder (fzf)


add the following lines to your `.bashrc` / `.zshrc` :
<!--more-->
```bash
# import fzf support for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function ssh2 () {
filter=${1:-"."}
target=$(egrep -o "Host (\b.+\b)" $HOME/.ssh/extras/* $HOME/.ssh/config - awk '{print $2}' - grep $filter - fzf -e)
echo "Remoting into: $target"
ssh $target
}
```

this provides following functions in the terminal:

* with `ssh2` you can search hosts of your ssh config and connect directly to it
* with `[ctrl]` + `[R]` you can do reverse search of command with fuzzy finder

## Links:

* [https://github.com/junegunn/fzf](https://github.com/junegunn/fzf)



