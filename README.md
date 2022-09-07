<div align="center">
    <h1>Limoji</h1>
    <p>Turning your favorite emojis into the world of ASCII</p>
    <a href="https://github.com/GEROGIANNIS/Limoji/releases/latest"><img alt="Releases" src="https://badgen.net/github/release/GEROGIANNIS/Limoji/stable?color=green"></a>
    <a href="https://github.com/GEROGIANNIS/Limoji/blob/main/LICENSE"><img alt="License" src="https://badgen.net/github/license/GEROGIANNIS/Limoji?color=orange"></a>
    <a href="https://github.com/GEROGIANNIS/Limoji/graphs/contributors"><img alt="Contributors" src="https://badgen.net/github/contributors/GEROGIANNIS/Limoji"></a>
    <a href="https://github.com/GEROGIANNIS/Limoji/pulls"><img alt="Merged PRs" src="https://badgen.net/github/merged-prs/GEROGIANNIS/Limoji?color=purple"></a>
    <a href="https://github.com/GEROGIANNIS/Limoji/actions"><img alt="CI" src="https://badgen.net/github/status/GEROGIANNIS/Limoji/main/ci"></a>
</div>

<br>

# Introduction

Limoji is an open source tool that makes it easy to choose between hundreds of cool ASCII emoticons and share them with your friends, all done using the terminal!

All you have to do is pick the right one or let Limoji choose it for you!

# Features

* Hundreds of available emoticons to choose from
* Random emoticon generator
* Automatic copy to the clipboard
* Wayland support

# Installation

## Debian / Ubuntu-based distributions (Officially supported)

Limoji is available as a <a href="https://github.com/GEROGIANNIS/Limoji/releases/latest">deb package</a>.

## Other GNU/Linux distributions

#### Requirements:

* xclip (X11) or wl-clipboard (Wayland)
* git

#### To install it:

Depending on your session type (X11 or Wayland) you will need the appropriate package for copying items to the clipboard. It is recommended that you install both.

xclip (X11):

```bash
# Arch:
sudo pacman -S xclip

# Fedora:
sudo dnf install xclip
```

wl-clipboard (Wayland):
```bash
# Arch Linux:
sudo pacman -S wl-clipboard

# Fedora:
sudo dnf install wl-clipboard
```

Clone this repository:

```bash
git clone https://github.com/GEROGIANNIS/Limoji ~/Limoji
```

Add Limoji's directory to your path (NOTE: You must restart your session after that):

```bash
echo export PATH="~/Limoji:$PATH" | tee -a ~/.bashrc
```

You can update Limoji using:

```bash
cd ~/Limoji && git pull
```

# Usage

```bash
limoji <emoticon-name>
```

Example:

```bash
$ limoji happy
  [✓] happy was copied to the clipboard successfully:
  :‑)
```

## Available commands

<table>
    <tr>
        <td><code>limoji --random</code></td>
        <td>Print a random emoticon</td>
    </tr>
    <tr>
        <td><code>limoji --emoticon</code></td>
        <td>Show a list of the available emoticons</td>
    </tr>
    <tr>
        <td><code>limoji --version</code></td>
        <td>Display Limoji's version</td>
    </tr>
    <tr>
        <td><code>limoji --help</code></td>
        <td>Show this list</td>
    </tr>
</table>

## Development

### Contributing to the project

1. Fork Limoji
2. Apply your proposed changes to the fork
3. Open a Pull Request

### Deployment

When everything is ready for a release, the version number needs to be incremented:

```bash
# Limoji 0.1.0

readonly VERSION="0.1.0"
```

Then run publish.sh:

```bash
./publish.sh
```

This script will automatically do the following:

* Generate a changelog for the new release
* Create the release commit
* Tag the new release
* Push everything to GitHub

GitHub actions is configured to build the package afterwards and draft a release.

<br>

#### Todo:
- [ ] Localization
- [x] Packaging
- [x] Help Page
- [x] Update README.md
- [x] Make A Release
- [x] Add Option To Receive Another Emoticon
- [ ] BetterDiscord Support (Needs a complete rewrite of Limoji)
