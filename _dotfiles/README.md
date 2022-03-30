# Dotfiles

## Quickstart
Clone this repository into your home directory, then use [stow](https://www.gnu.org/software/stow/) to apply a given configuration. For example, to apply the `kitty` configuration:
```
cd ~/dotfiles_public # or whatever you named it
stow kitty
```
This will create a symlink at the appropriate spot linking to the configuration in this repo.  

Any folder in this repo that is not prefixed with "_" or "." is a dotfile configuration that can be applied.

## References
I found these two articles immensely helpful when setting this up. I encourage reading them to better understand stow:
- https://alexpearce.me/2016/02/managing-dotfiles-with-stow/
- https://www.stevenrbaker.com/tech/managing-dotfiles-with-gnu-stow.html

## Submodules
You may also want to use [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

For example, my `.zshrc` references a custom plugin ([`you-should-use`](https://github.com/MichaelAquilina/zsh-you-should-use)) installed via another git repo. I want to track what custom plugins I have installed, so I added it to the `.gitmodules` file using: 
```
git submodule add https://github.com/MichaelAquilina/zsh-you-should-use.git zsh/.oh-my-zsh/custom/plugins/you-should-use
```

Then to set things up on another machine, I either clone with `--recurse-submodules` or run:
```
git submodule update --init --recursive
```

## Other solutions
There are many options for managing your dotfiles. These are some of the other ways I've considered, although there are many more:
- Raw `git`, discussed [here](https://news.ycombinator.com/item?id=11071754). However, I prefer having symlinks and being able to pick and choose which dotfiles to apply from a repository.
- [yadm](https://yadm.io/), which has cool features like encryption and alternate sections within files for different systems. I stuck with `stow` as I was already using it, but I might switch over.
- [chezmoi](https://www.chezmoi.io), which seems to have [more features](https://www.chezmoi.io/comparison-table/). At the moment it's a bit overkill pour moi.
