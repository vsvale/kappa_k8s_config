`git clone https://github.com/vsvale/kappa_k8s_config.git`

## GitFlow

- `sudo apt install git-flow`
- `sudo nano ~/.bashrc` add at end:

```
    git_data() {

        if [ -d .git ]
        then
                git status 2> /dev/null | grep "working tree clean" &> /dev/null
                if [ $? -ne 0 ]; then STATUS="!"; else STATUS=""; fi
                echo -n " (`git branch 2>/dev/null | grep '^*' | colrm 1 2`$STATUS)"
        fi
}

export PS1="\u@\h \[\033[36m\]\w\[\033[91m\]\$(git_data) \[\033[00m\]$ "
```

- `git checkout -b develop`
- `git flow init`
