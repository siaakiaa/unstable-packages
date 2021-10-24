# Repository for new/unstable packages

This repository has been initially made as extension to [termux-packages](https://github.com/termux/termux-packages)
in order to resolve ownership issues of https://termux.net, which led to impossibility to upload new packages
to main repository. Introducing the "Unstable" packages repo allowed users to preview packages that soon should
be available for installation to everyone.

Now as this repository doesn't do its function for years, it is going to be closed. Packages that are working will be
moved to main repository and available out-of-box through package manager. Everything that was broken will be moved
to directory "disabled-packages" and will wait for improvements.

**Configuration package `unstable-repo` will be removed within 1-2 days, i.e. when mirrors have been synced. Git repo
also going to be removed at this time.**

For compatibility reasons, i.e. to not break existing installations of `unstable-repo` and mirroring setups, following
URL remains to be in use and will provide an empty apt repository.
```
https://packages.termux.org/apt/termux-unstable/
```
