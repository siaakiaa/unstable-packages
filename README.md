# Repository for unstable packages

[![Packages last build status](https://github.com/termux/unstable-packages/workflows/Packages/badge.svg)](https://github.com/termux/unstable-packages/actions)

<img src=".github/static/powered-by-fosshost.png" alt="Powered by FossHost" width="128px"></img>

## Status of packages

Here is a list of available packages with some information about their usability.

| Package           | Is stable ? | Need root ? | Notes                                            |
|:------------------|:-----------:|:-----------:|:-------------------------------------------------|
| atomvm            |             |             | As its readme states: AtomVM is still in its early stages. |
| bftpd             |             |             | Needs patches in order to be usable on rootless Termux. |
| biber             |             |             | Sideloaded.                                      |
| electrum          |             |             | Uses external python modules.                    |
| enscript          |             |             |                                                  |
| fetchmail         |             |             | fetchmailconf requires tkinter in python2.       |
| gitflow-avh       |             |             | Requires dependency list fix.                    |
| guile18           |             |             | Is https://github.com/termux/termux-packages/issues/3360 still applicable ? |
| guile             |             |             | Is https://github.com/termux/termux-packages/issues/3360 still applicable ? |
| intltool          |             |             | Not tested. Sideloaded Perl module.              |
| jigdo             |             |             | Not tested.                                      |
| libburn           |             |             |                                                  |
| libisoburn        |             |             | Reports sizeof(off_t) is too small for 32bit installations. Same goes for libburn and libisofs. |
| libisofs          |             |             |                                                  |
| libopenfec        |             |             | Not tested.                                      |
| libtd             |             |             |                                                  |
| nmh               |             |             | Not tested.                                      |
| pandoc            |             |             | Third-party precompiled binaries.                |
| racket            |             |             |                                                  |
| surfraw           |             |             | Needs fix for hardcoded paths.                   |
| tcc               |             |             | No support for generation of PIE executables.    |
| telegram-cli      |             |             | May crash under certain conditions.              |
| texlive-installer |             |             | Updates of infra packages changes settings, breaking texlive |
| yara              |             |             | Always exits with `error: 31`.                   |
| zeronet           |             |             | Uses external python modules. Installation failure. |

