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
                   -`
                  .o+`                   nms@nms-archlinux 
                 `ooo/                   ----------------- 
                `+oooo:                  OS: Arch Linux x86_64 
               `+oooooo:                 Host: HP Notebook 
               -+oooooo+:                Kernel: 5.18.2-arch1-1 
             `/:-:++oooo+:               Uptime: 15 hours, 19 mins 
            `/++++/+++++++:              Packages: 1139 (pacman) 
           `/++++++++++++++:             Shell: bash 5.1.16 
          `/+++ooooooooooooo/`           Resolution: 1366x768 
         ./ooosssso++osssssso+`          DE: Plasma 5.24.5 
        .oossssso-````/ossssss+`         WM: KWin 
       -osssssso.      :ssssssso.        WM Theme: Oxygen 
      :osssssss/        osssso+++.       Theme: [Plasma], Breeze [GTK2/3] 
     /ossssssss/        +ssssooo/-       Icons: Papirus-Dark [Plasma], Papirus-Dark [GTK2/3] 
   `/ossssso+/:-        -:/+osssso+-     Terminal: yakuake 
  `+sso+:-`                 `.-/+oso:    CPU: Intel i5-6200U (4) @ 2.800GHz 
 `++:.                           `-/+/   GPU: Intel Skylake GT2 [HD Graphics 520] 
 .`                                 `/   GPU: AMD ATI Radeon HD 8670A/8670M/8690M / R5 M330 / M430 / Radeon 520 Mobile 
```

## Settings

- `.zshrc` copied to `.linux/.zshrc`
- Konsole profiles (`~/.local/share/konsole/*.profile`) - copied to `.linux/konsole/`
- KDE global configurations (`~/.kde4/share/config/kdeglobals`) - copied to `.linux/kdeglobals.conf`
- Okular configurations (`~/.local/share/kxmlgui5/okular/part.rc`) - copied to `.linux/okular-part.xml`
