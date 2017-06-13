# Setup a Machine
setup dotfiles on a new machines by executing:
```bash
    > $ sh makesymlinks.sh
```

1. copies current dotfiles into `~/dotfiles_old`
2. creates a `~/dotfiles` directory
3. creates symbolic links to files in `~/dotfiles` 

* when editing, change and commit the files in `~/dotfiles`

- Also configures git to ignore directories/files in `.gitignore_global`
