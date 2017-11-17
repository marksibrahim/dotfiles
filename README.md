# Setup a Machine
setup dotfiles on a new machines by cloning into the home directory and executing
```bash
    > $ sh makesymlinks.sh
```

## The Magic Behind the Scenes
Running `makesymlinks`
1. copies current dotfiles into `~/dotfiles_old`
2. creates a `~/dotfiles` directory
3. creates symbolic links to files in `~/dotfiles` 

- Also configures git to ignore directories/files in `.gitignore_global`

- When editing, change and commit the files in `~/dotfiles`

## Vim Plugins

The `.vim` directory only contains the package manager Vundle. To install plugins:
```bash
    vim .vimrc
    :PluginInstall
```
Vundle is configured to install Vim plugins in `~/vim-plugins-vundle/`.
