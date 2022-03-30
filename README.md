# Overview
This public repository provides an example of how I organize my configuration of a Linux machine. The private version has two goals: first, to be able to restore a minimal setup on a new machine, and second, to track why I've made certain changes. Different branches can be used for different machines.

Although it started with just dotfiles, there are now three parts:
1. [Debian packages](https://www.debian.org/distrib/packages) that I personally installed.
2. [Dotfiles](https://wiki.archlinux.org/title/Dotfiles), managed using [stow](https://www.gnu.org/software/stow/).
3. [GNOME](https://www.gnome.org/) desktop environment configuration.

# Layout
Folders prefixed with "_" are organizational folders. Other non-hidden folders are dotfiles.
Please see the following READMEs:
- [Debian packages](_packages/README.md)
- [Dotfiles](_dotfiles/README.md)
- [GNOME](_gnome/README.md)

# Unimportant musings
## Other things I've considered tracking
### [RPM packages](https://www.redhat.com/sysadmin/create-rpm-package)
I haven't found it as necessary to track user-installed RPM packages, as I've found `DNF` outputs fewer false-positives than the various Debian package managers. Maybe I'll regret this, but for now I'm happy with it.

### [Snaps](https://snapcraft.io/about)
At the time of writing this [there isn't a great way of distinguishing between requested and automatically installed snaps](https://askubuntu.com/questions/1261242/how-to-list-installed-packages-using-snap).

I tried making a git hook to track the output of `snap changes`, but it's annoyingly time sensitive. Maybe `snap list` would be a better approach, but I don't have enough snaps to really care right now.

#### My poorly researched opinion that no-one asked for
From what I've gathered, snaps have their drawbacks. Mainly [being proprietary and forcefully auto-updating](https://news.ycombinator.com/item?id=23439326), with the latter being concerning due to supply-chain attacks. But snaps are sometimes the only easy way to install proprietary software, and the sandboxing is nice. Therefore my preference for installing software is loosely:
```
Trusted repository package > Flatpak > AppImage > Manually downloaded package > Snap > Building from source
```
If any of this is silly, tell me why! My primary concerns are ease of maintenance and security.

## Shouldn't you just use [NixOS or Nix](https://nixos.org/)?
I'd like to try them some day. It just seems a bit overkill at the moment.
