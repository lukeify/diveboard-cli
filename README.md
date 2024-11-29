# `diveboard-cli`

Diveboard is a macOS configuration tool designed to setup your Mac into a reproducible state and monitor for divergences from that state.
Diveboard can manage:

* Your installed apps, packages, and CLI tools (via `brew`).
* Some macOS configuration (via `defaults`).
* Your dotfiles and other configurations.
* Divergence from state, when your Mac no longer represents your `divefiles` repository, with options to reconcile.
* Manual macOS configuration that cannot be controlled programmatically, by providing suggestions to you.

Diveboard is _configuration-as-code_, and a `divefiles` repository is needed to configure your Mac.


## `divefiles`

A `divefiles` repository is set of configurations bundled together and hosted on GitHub that represent the preferred state of your Mac. 
You can either create one yourself, or request `diveboard-cli` to use someone elses.
An example `divefiles` repository can be found [here](https://github.com/lukeify/divefiles).
