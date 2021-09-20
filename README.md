# Repository for unstable packages

[![Packages last build status](https://github.com/termux/unstable-packages/workflows/Packages/badge.svg)](https://github.com/termux/unstable-packages/actions)

<img src=".github/static/powered-by-fosshost.png" alt="Powered by FossHost" width="128px"></img>

There are located packages which were requested, but not added to the [main][termux-packages] Termux repository due to various reasons. Packages available here may have lower quality, be unstable or not work at all. Report issues to https://github.com/termux/termux-packages/issues.

## Support

[![Donate with Ethereum](https://en.cryptobadges.io/badge/big/0x3CC8F61862e5c3Ad62A7eea0c3048853FA31af23?showBalance=true)](https://en.cryptobadges.io/donate/0x3CC8F61862e5c3Ad62A7eea0c3048853FA31af23)

## How to enable this repository

Repository is not enabled in Termux by default. Enable it with this command to be
able to install its packages:
```
pkg install unstable-repo
```

## Building packages manually

You can build all packages manually by using provided docker image. The only
requirements are Linux-based host with Docker installed.

1. Clone this repository:
	```
	git clone https://github.com/termux/unstable-packages
	```

2. Enter build environment (will download docker image if necessary):
	```
	cd ./unstable-packages
	./start-builder.sh
	```

3. Choose package you want to build and run:
	```
	./build-package.sh -a ${arch} ${package name}
	```
	Replace `${arch}` with target CPU architecture and `${package name}` with
	package name you want to build.

## Status of packages

Here is a list of available packages with some information about their usability.

| Package           | Is stable ? | Need root ? | Notes                                            |
|:------------------|:-----------:|:-----------:|:-------------------------------------------------|
| atomvm            |             |             | As its readme states: AtomVM is still in its early stages. |
| bftpd             |             |             | Needs patches in order to be usable on rootless Termux. |
| biber             |             |             | Sideloaded.                                      |
| ccls              |             |             | Not tested.                                      |
| cppcheck          |             |             | Not tested.                                      |
| cups              |             |             | When trying to add a printer, it hangs and CPU usage goes to 100%. |
| distcc            |             |             | Not tested.                                      |
| electrum          |             |             | Uses external python modules.                    |
| enscript          |             |             |                                                  |
| fdroidcl          |             |             | Some functionality relies on ADB.                |
| fetchmail         |             |             | fetchmailconf requires tkinter in python2.       |
| gitflow-avh       |             |             | Requires dependency list fix.                    |
| guile18           |             |             | Is https://github.com/termux/termux-packages/issues/3360 still applicable ? |
| guile             |             |             | Is https://github.com/termux/termux-packages/issues/3360 still applicable ? |
| haproxy           |             |             | Not tested.                                      |
| intltool          |             |             | Not tested. Sideloaded Perl module.              |
| jigdo             |             |             | Not tested.                                      |
| libburn           |             |             |                                                  |
| libisoburn        |             |             | Reports sizeof(off_t) is too small for 32bit installations. Same goes for libburn and libisofs. |
| libisofs          |             |             |                                                  |
| libopenfec        |             |             | Not tested.                                      |
| libsixel          |             |             | Not tested.                                      |
| libtd             |             |             |                                                  |
| nmh               |             |             | Not tested.                                      |
| openldap          |             |             | Not tested.                                      |
| pandoc            |             |             | Third-party precompiled binaries.                |
| racket            |             |             |                                                  |
| rapidjson         |             |             | Not tested.                                      |
| restic-server     |             |             | Not tested.                                      |
| samba             |             | preferable  | smbd CPU usage may go to 100%. Hardcoded root account. |
| shtool            |             |             | Not tested.                                      |
| smalltalk         |             |             |                                                  |
| srelay            |             |             |                                                  |
| surfraw           |             |             | Needs fix for hardcoded paths.                   |
| tcc               |             |             | No support for generation of PIE executables.    |
| telegram-cli      |             |             | May crash under certain conditions.              |
| texlive-installer |             |             | Updates of infra packages changes settings, breaking texlive |
| vlang             |             |             | REPL is broken, everything else untested.        |
| yara              |             |             | Always exits with `error: 31`.                   |
| zeronet           |             |             | Uses external python modules. Installation failure. |

### Disabled packages

These packages are excluded from main source tree. Some of them may be available for installation, others are not.

- **a2ps** - segmentation fault on AArch64 for unknown reason.

- **geckodriver** - requires Firefox package which is not available for Termux.

- **ghc** - can't be compiled with latest NDK as supports only LLVM 9.

- **micropython** - requires update & build fix.

- **roc** - doesn't support CI autobuilds as requires Pulseaudio build directory.

- **rustc-nightly** - needs update & fix for build.sh.

[termux-packages]: <https://github.com/termux/termux-packages>
