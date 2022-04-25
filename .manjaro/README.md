# Manjaro

## Packages

To get a list of foreign packages and save it as a file:

```sh
pamac list --foreign --quiet > .manjaro/pkgs-aur.txt
# or
pamac list -m -q > .manjaro/pkgs-aur.txt
```

To get a list of explicitly installed packages:

```sh
pamac list --explicitly-installed --quiet
# or
pamac list -e -q
```

Configurations:

```text
$ neofetch
██████████████████  ████████   nms@nms-manjaro
██████████████████  ████████   ---------------
██████████████████  ████████   OS: Manjaro Linux x86_64
██████████████████  ████████   Host: HP Notebook
████████            ████████   Kernel: 5.17.1-3-MANJARO
████████  ████████  ████████   Uptime: 1 day, 18 hours, 43 mins
████████  ████████  ████████   Packages: 1574 (pacman)
████████  ████████  ████████   Shell: bash 5.1.16
████████  ████████  ████████   Resolution: 1366x768
████████  ████████  ████████   DE: Plasma 5.24.4
████████  ████████  ████████   WM: KWin
████████  ████████  ████████   WM Theme: Oxygen
████████  ████████  ████████   Theme: Breath Light [Plasma], Breeze [GTK2/3]
████████  ████████  ████████   Icons: Papirus-Dark [Plasma], Papirus-Dark [GTK2/3]
                               Terminal: yakuake
                               CPU: Intel i5-6200U (4) @ 2.800GHz
                               GPU: Intel Skylake GT2 [HD Graphics 520]
                               GPU: AMD ATI Radeon HD 8670A/8670M/8690M / R5 M330 / M430 / Radeon 520 Mobile
                               Memory: 2460MiB / 3813MiB

$ sysfetch
nms@nms-manjaro
uptime ~ 1 days, 18 hrs, 44 mins
kernel ~ Linux 5.17.1-3-MANJARO
distro ~ Manjaro Linux   arch ~ x86_64
term ~ /usr/bin/yakuake   shell ~ bash
de/wm ~ KDE   theme ~ Adwaita
pkgs ~ 1575 (pacman) 1 (src)
cpu ~  Intel Core i5-6200U 2.8@2.68 GHz
gpu ~ Intel  Skylake GT2 HD Graphics 520 (rev 07)
mobo ~ HP 81DC
disk ~ WDC WD10JPVX-60JC3T0   43/52 GB   87%
ram ~ 854/3905 MB   swap ~ 916/4083 MB
 __    __     ______     __   __       __     ______     ______     ______
/\ "-./  \   /\  __ \   /\ "-.\ \     /\ \   /\  __ \   /\  == \   /\  __ \
\ \ \-./\ \  \ \  __ \  \ \ \-.  \   _\_\ \  \ \  __ \  \ \  __<   \ \ \/\ \
 \ \_\ \ \_\  \ \_\ \_\  \ \_\\"\_\ /\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\
  \/_/  \/_/   \/_/\/_/   \/_/ \/_/ \/_____/   \/_/\/_/   \/_/ /_/   \/_____/
```

## Settings

- SSH configurations (`~/.ssh/config`) - copied to `.manjaro/ssh-config.txt`
- Emoji font configurations (`/etc/fonts/local.conf`) - copied to `.manjaro/fonts-local.xml`
- Konsole profile (`~/.local/share/konsole/*.profile`) - copied to `.manjaro/konsole.conf`
- KDE global configurations (`~/.kde4/share/config/kdeglobals`) - copied to `.manjaro/kdeglobals.conf`
- Okular configurations (`~/.local/share/kxmlgui5/okular/part.rc`) - copied to `.manjaro/okular-part.xml`
