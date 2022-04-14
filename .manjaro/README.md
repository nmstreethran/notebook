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
████████  ████████  ████████   Uptime: 3 hours, 59 mins
████████  ████████  ████████   Packages: 1555 (pacman)
████████  ████████  ████████   Shell: bash 5.1.16
████████  ████████  ████████   Resolution: 1366x768
████████  ████████  ████████   DE: Plasma 5.24.3
████████  ████████  ████████   WM: KWin
████████  ████████  ████████   WM Theme: Oxygen
████████  ████████  ████████   Theme: Breath Light [Plasma], Breeze [GTK2/3]
████████  ████████  ████████   Icons: Papirus-Dark [Plasma], Papirus-Dark [GTK2/3]
                               Terminal: yakuake
                               CPU: Intel i5-6200U (4) @ 2.800GHz
                               GPU: Intel Skylake GT2 [HD Graphics 520]
                               GPU: AMD ATI Radeon HD 8670A/8670M/8690M / R5 M330 / M430 / Radeon 520 Mobile
                               Memory: 1580MiB / 3813MiB

$ sysfetch
nms@nms-manjaro
uptime ~ 3 hrs, 58 mins
kernel ~ Linux 5.16.14-1-MANJARO
distro ~ Manjaro Linux   arch ~ x86_64
term ~ /usr/bin/yakuake   shell ~ bash
de/wm ~ KDE   theme ~ Adwaita
pkgs ~ 1556 (pacman) 2 (src)
cpu ~  Intel Core i5-6200U 2.8@2.70 GHz
gpu ~ Intel  Skylake GT2 HD Graphics 520 (rev 07)
mobo ~ HP 81DC
disk ~ WDC WD10JPVX-60JC3T0   40/52 GB   82%
ram ~ 857/3905 MB   swap ~ 654/4083 MB
 __    __     ______     __   __       __     ______     ______     ______
/\ "-./  \   /\  __ \   /\ "-.\ \     /\ \   /\  __ \   /\  == \   /\  __ \
\ \ \-./\ \  \ \  __ \  \ \ \-.  \   _\_\ \  \ \  __ \  \ \  __<   \ \ \/\ \
 \ \_\ \ \_\  \ \_\ \_\  \ \_\\"\_\ /\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\
  \/_/  \/_/   \/_/\/_/   \/_/ \/_/ \/_____/   \/_/\/_/   \/_/ /_/   \/_____/
```
