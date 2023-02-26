# FedoraSetup

This is a __shell script__ designed to simplify tasks whenever I run a fresh installation of __Fedora Linux and derivatives__. The script will perform the following instructions:

## DNF configuration

- Enabling the Fastest Mirror plugin for a faster download speed;
- Increase the max parallel downloads to 10 for a smoother experience;
- Enabling the third-party repositories (RPM Fusion) for a wider software availability.

## Software installation

- Installing window tiling add-ons and other add-ons for KDE Plasma and GNOME desktop environments;
- Installing my personal choice of software such as [Neovim] for text and code editing, [qutebrowser] for web browsing, etc;
- Installing media codecs for multimedia content.

[Neovim]: https://github.com/neovim/neovim
[qutebrowser]: https://github.com/qutebrowser/qutebrowser

More information about the script can be found at the source-code. 

## Running the script

The script can be executed with the following command:

```sh
./systemsetup.sh
```
If the script can't be executed for any reasons, make it executable with the following command:

```sh
chmod +x systemsetup.sh
```
