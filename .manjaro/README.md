# Manjaro packages

To get a list of foreign packages and save it as a file:

```sh
pamac list --foreign --quiet > aur.txt
# or
pamac list -m -q > aur.txt
```

To get a list of explicitly installed packages:

```sh
pamac list --explicitly-installed
# or
pamac list -e
```

Configurations:

```text
$ neofetch
██████████████████  ████████   nms@nms-manjaro
██████████████████  ████████   ---------------
██████████████████  ████████   OS: Manjaro Linux x86_64
██████████████████  ████████   Host: HP Notebook
████████            ████████   Kernel: 5.16.14-1-MANJARO
████████  ████████  ████████   Uptime: 8 hours, 3 mins
████████  ████████  ████████   Packages: 1550 (pacman)
████████  ████████  ████████   Shell: bash 5.1.16
████████  ████████  ████████   Resolution: 1366x768
████████  ████████  ████████   DE: Plasma 5.24.3
████████  ████████  ████████   WM: KWin
████████  ████████  ████████   WM Theme: Oxygen
████████  ████████  ████████   Theme: Breath Light [Plasma], Breeze [GTK2/3]
████████  ████████  ████████   Icons: Papirus-Dark [Plasma], Papirus-Dark [GTK2/3]
                               Terminal: yakuake

$ sysfetch
nms@nms-manjaro
uptime ~ 8 hrs, 4 mins
kernel ~ Linux 5.16.14-1-MANJARO
distro ~ Manjaro Linux   arch ~ x86_64
term ~ /usr/bin/yakuake   shell ~ bash
de/wm ~ KDE   theme ~ Adwaita
pkgs ~ 1551 (pacman) 2 (src)
 __    __     ______     __   __       __     ______     ______     ______
/\ "-./  \   /\  __ \   /\ "-.\ \     /\ \   /\  __ \   /\  == \   /\  __ \
\ \ \-./\ \  \ \  __ \  \ \ \-.  \   _\_\ \  \ \  __ \  \ \  __<   \ \ \/\ \
 \ \_\ \ \_\  \ \_\ \_\  \ \_\\"\_\ /\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\
  \/_/  \/_/   \/_/\/_/   \/_/ \/_/ \/_____/   \/_/\/_/   \/_/ /_/   \/_____/
```
