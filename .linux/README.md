# Linux

## Packages

To get a list of foreign packages and save it as a file:

```sh
pacman -Qqem > .linux/pkgs-aur.txt
```

To get a list of explicitly installed packages:

```sh
pacman -Qqen > .linux/pkgs.txt
```

Configurations:

```text
$ neofetch
                   -`                    nms@nms-archlinux
                  .o+`                   -----------------
                 `ooo/                   OS: Arch Linux x86_64
                `+oooo:                  Host: HP Notebook
               `+oooooo:                 Kernel: 5.18.1-arch1-1
               -+oooooo+:                Uptime: 54 mins
             `/:-:++oooo+:               Packages: 1137 (pacman)
            `/++++/+++++++:              Shell: bash 5.1.16
           `/++++++++++++++:             Resolution: 1366x768
          `/+++ooooooooooooo/`           DE: Plasma 5.24.5
         ./ooosssso++osssssso+`          WM: KWin
        .oossssso-````/ossssss+`         WM Theme: Oxygen
       -osssssso.      :ssssssso.        Theme: [Plasma], Breeze [GTK2/3]
      :osssssss/        osssso+++.       Icons: Papirus-Dark [Plasma], Papirus-Dark [GTK2/3]
     /ossssssss/        +ssssooo/-       Terminal: yakuake
   `/ossssso+/:-        -:/+osssso+-     CPU: Intel i5-6200U (4) @ 2.800GHz
  `+sso+:-`                 `.-/+oso:    GPU: Intel Skylake GT2 [HD Graphics 520]
 `++:.                           `-/+/   GPU: AMD ATI Radeon HD 8670A/8670M/8690M / R5 M330 / M430 / Radeon 520 Mobile
 .`                                 `/   Memory: 2402MiB / 3816MiB
```

## Settings

- `.zshrc` copied to `.linux/.zshrc`
- Konsole profiles (`~/.local/share/konsole/*.profile`) - copied to `.linux/konsole/`
- KDE global configurations (`~/.kde4/share/config/kdeglobals`) - copied to `.linux/kdeglobals.conf`
- Okular configurations (`~/.local/share/kxmlgui5/okular/part.rc`) - copied to `.linux/okular-part.xml`
