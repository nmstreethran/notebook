# Linux

## Packages

To get a list of foreign packages and save it as a file:

```sh
pacman -Qmq > .linux/pkgs-aur.txt
```

To get a list of explicitly installed packages:

```sh
pacman -Qeq > .linux/pkgs.txt
```

Configurations:

```text
$ neofetch
                   -`                    nms@nms-archlinux
                  .o+`                   -----------------
                 `ooo/                   OS: Arch Linux x86_64
                `+oooo:                  Host: HP Notebook
               `+oooooo:                 Kernel: 5.17.6-arch1-1
               -+oooooo+:                Uptime: 2 hours, 12 mins
             `/:-:++oooo+:               Packages: 811 (pacman)
            `/++++/+++++++:              Shell: bash 5.1.16
           `/++++++++++++++:             Resolution: 1366x768
          `/+++ooooooooooooo/`           DE: Plasma 5.24.5
         ./ooosssso++osssssso+`          WM: KWin
        .oossssso-````/ossssss+`         Theme: [Plasma], Breeze [GTK2/3]
       -osssssso.      :ssssssso.        Icons: Papirus-Dark [Plasma]
      :osssssss/        osssso+++.       Terminal: yakuake
     /ossssssss/        +ssssooo/-       CPU: Intel i5-6200U (4) @ 2.800GHz
   `/ossssso+/:-        -:/+osssso+-     GPU: Intel Skylake GT2 [HD Graphics 520]
  `+sso+:-`                 `.-/+oso:    GPU: AMD ATI Radeon HD 8670A/8670M/8690M / R5 M330 / M430 / Radeon 520 Mobile
 `++:.                           `-/+/   Memory: 2437MiB / 3816MiB
 .`                                 `/
```

## Settings

- `.zshrc` copied to `.linux/.zshrc`
- Konsole profiles (`~/.local/share/konsole/*.profile`) - copied to `.linux/konsole/`
- KDE global configurations (`~/.kde4/share/config/kdeglobals`) - copied to `.linux/kdeglobals.conf`
- Okular configurations (`~/.local/share/kxmlgui5/okular/part.rc`) - copied to `.linux/okular-part.xml`
