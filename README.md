# About

**NOTE**: I no longer use this repository to setup my shell configurations.

**shell-config** is really just my personal shell configurations. So, yeah.

## Usage

Download and install
[Sauce Code Pro Nerd Font](https://www.nerdfonts.com/font-downloads) first.

### Bash

Please install first using a non-root user. If your non-root user needs `sudo`
to install Starship, add the `-s` parameter to the invocation of the install
script.

```bash
git clone https://github.com/rfpludwick/shell-config
shell-config/bash/install/main.sh [-s (sudo for Starship install)]
```

Installing without `git` on the system?

```bash
wget -qO- https://raw.githubusercontent.com/rfpludwick/bash-config/main/bash/install/no-git.sh | bash -s [-- -s (sudo for Starship install)]
```

If you want to setup the root user too, then run `bash/install/main.sh` as root.
