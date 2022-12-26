<div align="center">
    <pre>|==========================================|
 ██╗     ██╗███╗   ███╗ ██████╗      ██╗██╗
 ██║     ██║████╗ ████║██╔═══██╗     ██║██║
 ██║     ██║██╔████╔██║██║   ██║     ██║██║
 ██║     ██║██║╚██╔╝██║██║   ██║██   ██║██║
 ███████╗██║██║ ╚═╝ ██║╚██████╔╝╚█████╔╝██║
 ╚══════╝╚═╝╚═╝     ╚═╝ ╚═════╝  ╚════╝ ╚═╝
|==========================================|</pre>
    <p>
    Turning your favorite emojis into the world of Unicode
    </p>
    <a href="https://github.com/GEROGIANNIS/Limoji/releases/latest">
        <img alt="Releases" src="https://flat.badgen.net/github/release/GEROGIANNIS/Limoji/stable?color=green">
    </a>
    <a href="https://github.com/GEROGIANNIS/Limoji/blob/main/LICENSE">
        <img alt="License" src="https://flat.badgen.net/github/license/GEROGIANNIS/Limoji?color=orange">
    </a>
    <a href="https://github.com/GEROGIANNIS/Limoji/graphs/contributors">
        <img alt="Contributors" src="https://flat.badgen.net/github/contributors/GEROGIANNIS/Limoji">
    </a>
    <a href="https://github.com/GEROGIANNIS/Limoji/pulls">
        <img alt="Merged PRs" src="https://flat.badgen.net/github/merged-prs/GEROGIANNIS/Limoji?color=purple">
    </a>
    <a href="https://github.com/GEROGIANNIS/Limoji/actions">
        <img alt="CI" src="https://flat.badgen.net/github/checks/GEROGIANNIS/Limoji">
    </a>
</div>

<br>

# 📖 Introduction

Limoji is an open source tool that makes it easy to choose between hundreds of cool Unicode emoticons and share them with your friends, all done using the terminal!

All you have to do is pick the right one or let Limoji choose it for you!

# Features

* Hundreds of available emoticons to choose from
* Automatic copy to the clipboard
* Random emoticon generator
* 100% free and open source
* Lightweight and responsive
* Wayland support
* Tiny footprint (less than 30KB!)

# ⬇️ Installation

## Debian / Ubuntu-based distributions (Officially supported)

<table>
    <th>Repository</th>
    <th>Automatic Updates</th>
    <th>How to install</th>
    <tr>
	    <td>GitHub</td>
	    <td align="center">❌</td>
	    <td>
		    <a href="https://github.com/GEROGIANNIS/Limoji/releases/latest">Download</a> the .deb file
	    </td>
    </tr>
    <tr>
        <td>GitHub (deb-get)</td>
	    <td align="center">✔️</td>
	    <td>
		    Follow the <a href=#installation-using-deb-get>instructions below</a>
	    </td>
    </tr>
        <tr>
	    <td>Gemfury</td>
	    <td align="center">✔️</td>
	    <td>
		    Follow the <a href=#apt-repository-gemfury>instructions below</a>
	    </td>
    </tr>
</table>

### APT repository (Gemfury):

Run the following commands to add it:
```sh
# Add the repository
echo "deb [trusted=yes] https://apt.fury.io/lefterisgar/ * *" | sudo tee /etc/apt/sources.list.d/limoji.list

# Update the package indexes
sudo apt update

# Install Limoji
sudo apt install limoji
```
### Installation using deb-get:

* Download and install [deb-get](https://github.com/wimpysworld/deb-get).
* Run `deb-get install limoji`

*Note: deb-get is 3rd party software, not to be associated with apt-get.*

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

# 📄 Usage

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
        <td><code>-e, --emoticons</code></td>
        <td>Show a list of the available emoticons</td>
    </tr>
    <tr>
        <td><code>-h, --help</code></td>
        <td>Show this list</td>
    </tr>
    <tr>
        <td><code>-i, --info</code></td>
        <td>Show info about the project</td>
    </tr>
    <tr>
        <td><code>-r, --random</code></td>
        <td>Print a random emoticon</td>
    </tr>
    <tr>
        <td><code>-v, --version</code></td>
        <td>Display Limoji's version</td>
    </tr>
</table>

By default, `limoji --version` will query GitHub's API to check if a new version is available. If you wish to disable this check, use the `--no-update-check` flag:

```bash
$ limoji --version --no-update-check

# Shortened version:
$ limoji -v -nu
```

# 🔨 Development

## Contributing to the project

1. Fork Limoji
2. Apply your proposed changes to the fork
3. Open a pull request

## Deployment

When everything is ready for a release, the version number needs to be incremented:

```bash
# Limoji 1.0.0

limoji_version="1.0.0"
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

# 💬 Todo:
- [ ] Localization
- [ ] Search Command
- [ ] Emoticon Creator
- [ ] Chrome OS Support
- [x] Packaging
- [x] Help Page
- [x] Update README.md
- [x] Make A Release
- [x] Add Option To Receive Another Emoticon
- [x] Add Info Command
