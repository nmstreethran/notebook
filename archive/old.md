# Old notes

## Git

<details>
<summary>
Click to expand
</summary>

### Reducing the repository size using [BFG](https://rtyley.github.io/bfg-repo-cleaner/) <!-- omit in toc -->

<https://docs.gitlab.com/ee/user/project/repository/reducing_the_repo_size_using_git.html>

Clone a bare repository and create a backup of it:

```sh
git clone --mirror git@github.com:USERNAME/REPOSITORY.git
```

Download and run BFG (Java / OpenJDK must be installed):

```sh
# to strip blobs bigger than a particular size (e.g., 100 MB)
java -jar bfg.jar --strip-blobs-bigger-than 100M REPOSITORY.git

# delete all files named 'id_rsa' or 'id_dsa'
java -jar bfg.jar --delete-files id_{dsa,rsa} REPOSITORY.git

# delete all pdfs
java -jar bfg.jar --delete-files *.pdf REPOSITORY.git

# replace all passwords listed in a file (prefix lines 'regex:' or
# 'glob:' if required) with ***REMOVED***
java -jar bfg.jar --replace-text passwords.txt REPOSITORY.git
```

Check the changes that have been made and clean unwanted data:

```sh
cd REPOSITORY.git
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

Push to update remote repository:

```sh
git push
```

***Note:*** branches must be unprotected in GitLab for a successful push.

### Security <!-- omit in toc -->

#### [Using credential helper to store password (less secure method)](https://stackoverflow.com/a/17979600/4573584)

```sh
git config --global credential.helper store
```

**Warning**: username and password / personal access token are stored unencrypted at `~/.git-credentials` through this method.

Use the following command to undo credential storage:

```sh
git config --unset credential.helper
```

### Subtrees <!-- omit in toc -->

#### [Including wiki in the main code repository as a subtree](https://stackoverflow.com/a/33182223/4573584)

```sh
git clone git://github.com/username/repository
cd proj
git remote add -f docs https://github.com/username/repository.wiki.git
git merge -s ours --no-commit --allow-unrelated-histories docs/master
git read-tree --prefix=docs/ -u docs/master
git commit -m "GitHub docs subtree merged in docs/"
```

Changes made in the actual wiki can be merged to the main code repository:

```sh
git pull -s subtree docs master
```

Merging changes the other way is complicated.

More about subtree merges on [GitHub](https://docs.github.com/en/github/using-git/about-git-subtree-merges).

### [Invalid username or password error](https://stackoverflow.com/a/34919582/4573584) <!-- omit in toc -->

Could happen due to two-factor authentication. To resolve the issue:

- manually generate a personal access token on GitHub
- assign permission to access repo and gist (just like the other tokens)
- copy the token and use it instead of the password

</details>

## System

<details>
<summary>
Click to expand
</summary>

### GNOME <!-- omit in toc -->

#### [Install GNOME tweak tool](https://askubuntu.com/a/968630/714808)

```sh
sudo apt install gnome-tweak-tool
```

#### Useful GNOME extensions

- [Dash to Panel](https://github.com/home-sweet-gnome/dash-to-panel)
- [Caffeine](https://extensions.gnome.org/extension/517/caffeine/)
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/)
- [Applications Overview Tooltip](https://extensions.gnome.org/extension/1071/applications-overview-tooltip/)
- [Applications Menu](https://extensions.gnome.org/extension/6/applications-menu/)
- [Start Overlay in Application View](https://extensions.gnome.org/extension/1198/start-overlay-in-application-view/)
- [OpenWeather](https://extensions.gnome.org/extension/750/openweather/)

### Installing Wine and fixing dependency issues <!-- omit in toc -->

Enable 32-bit architecture if system is 64-bit:

```sh
sudo dpkg --add-architecture i386
```

Download and add repository key:

```sh
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
```

Add the repository (replace `bionic` with your Ubuntu version):

```sh
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
```

Update packages:

```sh
sudo apt update
```

Install Wine package (from stable branch):

```sh
sudo apt install --install-recommends winehq-stable
```

This may throw dependency errors:

```sh
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 winehq-stable : Depends: wine-stable (= 5.0.0~bionic)
E: Unable to correct problems, you have held broken packages.
```

To fix the error, use the following command:

```sh
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64
```

This resulted in additional dependency errors on my system:

```sh
 wine-stable-amd64 : Depends: libfaudio0 but it is not installable
                     Recommends: libcapi20-3 but it is not going to be installed
                     Recommends: libosmesa6 but it is not going to be installed
 wine-stable-i386:i386 : Depends: libfaudio0:i386 but it is not installable
                         Recommends: libcapi20-3:i386 but it is not going to be installed
                         Recommends: libcups2:i386 but it is not going to be installed
                         Recommends: libglu1-mesa:i386 but it is not going to be installed or
                                     libglu1:i386
                         Recommends: libgsm1:i386 but it is not going to be installed
                         Recommends: libgssapi-krb5-2:i386 but it is not going to be installed
                         Recommends: libkrb5-3:i386 but it is not going to be installed
                         Recommends: libodbc1:i386 but it is not going to be installed
                         Recommends: libosmesa6:i386 but it is not going to be installed
                         Recommends: libsane:i386 or
                                     libsane1:i386 but it is not going to be installed
                         Recommends: libv4l-0:i386 but it is not going to be installed
                         Recommends: libxcomposite1:i386 but it is not going to be installed
                         Recommends: libxslt1.1:i386 but it is not going to be installed
```

Install the required [`libfaudio0`](https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/) libraries as recommended:

```sh
cd Downloads
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/amd64/libfaudio0_19.07-0~bionic_amd64.deb
wget https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/i386/libfaudio0_19.07-0~bionic_i386.deb
sudo dpkg -i libfaudio0_19.07-0~bionic_amd64.deb libfaudio0_19.07-0~bionic_i386.deb
sudo apt --fix-broken install
cd ..
```

Install all remaining dependencies and these additional libraries for compatibility reasons:

```sh
sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386
```

Finally, install Wine using the same command used earlier:

```sh
sudo apt-get install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64
```

References:

- <https://askubuntu.com/a/1145491/714808>
- <https://wiki.winehq.org/Ubuntu>
- <https://github.com/lutris/lutris/wiki/Wine-Dependencies>
- <https://wiki.winehq.org/FAQ#How_do_I_solve_dependency_errors_when_trying_to_install_Wine.3F>
- <https://forum.winehq.org/viewtopic.php?f=8&t=32192>

### Packages and GNOME extensions <!-- omit in toc -->

- [GRUB Customizer](https://launchpad.net/grub-customizer)
- [Open Graphics Drivers](https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers)
- [nautilus-admin (**archived**)](https://github.com/brunonova/nautilus-admin)
- [windowNavigator](https://extensions.gnome.org/extension/10/windownavigator/)
- [No Screen Blank](https://extensions.gnome.org/extension/2413/no-screen-blank/)
- [No Topleft Hot Corner](https://extensions.gnome.org/extension/118/no-topleft-hot-corner/)
- [Dynamic Panel Transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/)
- [AlternateTab](https://extensions.gnome.org/extension/15/alternatetab/)

#### [Changing GNOME screenshot directory](https://askubuntu.com/a/1102530/714808) <!-- omit in toc -->

Use an extension:

- <https://extensions.gnome.org/extension/1179/screenshot-locations/>
- <https://github.com/kiyui/gnome-shell-screenshotlocations-extension>

### Problems with drivers <!-- omit in toc -->

#### Realtek WiFi problems <!-- omit in toc -->

Secure boot should be disabled before installing these drivers.

See <https://askubuntu.com/a/635629/714808>.

#### [Computer boots to blank screen after Ubuntu upgrade](https://askubuntu.com/a/162076/714808) <!-- omit in toc -->

**Note:** It is recommended to upgrade using a **bootable USB or disk**. Upgrading through the Software Updater could potentially cause driver-related problems which can otherwise be avoided.

This is likely due to proprietary graphics card software not being installed by Ubuntu during the upgrade. To fix this, boot Ubuntu in `nomodeset` to bypass the blank screen. In the Grub menu, highlight 'Ubuntu' and press `e` to edit the entry. Replace `quiet splash` with `nomodeset`. Then, press `ctrl` + `x` to boot. Download and install the proprietary graphics card drivers and reboot to fix this permanently. See below, and <https://askubuntu.com/q/47506/714808> for more information about installing additional drivers.

**Note:** If this still doesn't fix the problem, set `nomodeset` permanently through the Grub Customiser.

**AMD Radeon software** - downloading directly from the AMD website:

- [Radeon™ Software for Linux® Installation](https://amdgpu-install.readthedocs.io/en/latest/)
- [Radeon™ Software for Linux® 20.10 Release Notes](https://www.amd.com/en/support/kb/release-notes/rn-amdgpu-unified-linux-20-10)
- <https://www.amd.com/en/support/kb/faq/amdgpupro-install>
- <https://www.amd.com/en/support/kb/release-notes/amdgpu-installation>

Open source PPAs:

- <https://askubuntu.com/a/1066106/714808>
- <https://help.ubuntu.com/community/AMDGPU-Driver>

Checking graphics card name and chipset:

```sh
sudo update-pciids # optional command, requires internet
lspci -nn | grep -E 'VGA|Display'
```

Add [the Open Graphics Drivers PPA](https://launchpad.net/~oibaf/+archive/ubuntu/graphics-drivers) and update:

```sh
sudo add-apt-repository ppa:oibaf/graphics-drivers
sudo apt-get update
sudo apt upgrade
```

Reconfigure to be safe:

```sh
sudo apt install --reinstall xserver-xorg-video-amdgpu
sudo dpkg --configure -a
sudo dpkg-reconfigure gdm3 ubuntu-session xserver-xorg-video-amdgpu
```

To enable accelerated video:

```sh
sudo apt-get install mesa-vdpau-drivers
```

To test the vdpau driver with mpv:

```sh
mpv --hwdec=vdpau yourvideofile
```

Reboot computer and see if everything works as intended.

### Guides <!-- omit in toc -->

- [Making Ubuntu look like Windows](https://www.howtogeek.com/353819/how-to-make-ubuntu-look-more-like-windows/)

### Prevent the screen from turning off when the lockscreen is active  <!-- omit in toc -->

Using an extension by [u/SomeGenericUsername](https://old.reddit.com/r/gnome/comments/2hj8bx/has_anyone_figured_out_a_way_to_keep_the_screen/cktqjqd/)

> I don't think it is possible to achieve that with config options alone as it is not intended to work that way and certain parts of the sequence from fading to blanking to locking the screen are hardcoded. This gets complicated even further by this whole thing being spread across multiple processes. The shell is what does the fading but then it tells gnome-settings-daemon to blank the screen via d-bus signals. That's at least my limited understanding from quickly glancing at the involved code.
>
> Now, I've just written an extension, that kind of works around all of that. It disables the fading and removes the emission of the d-bus signal. This whole thing is super ugly and would never stand a chance to get accepted for extensions.gnome.org as extensions are supposed to be disabled when the lock screen gets activated, but that won't make much sense for this extension. That also means you can't disable it like you are used to, but that you have to restart gnome-shell after disabling if for it to be actually disabled. Another thing is that there might be other applications listening to the d-bus signal I've disabled and that might have some security implications. I'm not sure which signal gnome-keyring uses to lock its keyring when the lock screen gets shown, but this signal might be it or it might be part of a signal chain to some other signal that would lock the keyring. The way I've removed the signal emission might also affect gnome-shell internally, so maybe it won't automatically change your online status to away anymore, but I haven't checked for that either.
>
> I've only tested the extension on 3.14, but I think it should work on 3.10 or 3.12 as well, if you haven't upgraded yet. Also my testing was not really thorough, but it seems to be working for both, locking the screen based on the user being idle and on clicking the lock button.
> So after all this has been said, here is the extension now:
>
> [Link to Dropbox file]
>
> Extract it to `~/.local/share/gnome-shell/extensions/`
>
> Edit (2017-03-24): Updated the extension to allow manually disabling it (still a hack though), tested with 3.24, and updated the link because the old one wasn't working anymore (thanks Dropbox...).

[SoCRaT](https://techienotes.blog/2018/04/16/how-to-to-prevent-the-screen-from-turning-off-when-locked-with-gnome-shell-on-ubuntu-18-04/) has made an updated version to support GNOME 3.28. Alternatively, edit `metadata.json` in the original download to include 3.28.

Once the extracted folder is placed in `~/.local/share/gnome-shell/extensions/`, use Tweaks to turn the "No screen blank" extension on. A restart may be required before it shows up in the list of extensions.

### [Globally customise system UI font on Ubuntu](https://github.com/Microsoft/vscode/issues/10144#issuecomment-337490205) <!-- omit in toc -->

Paste the following in your local font configuration file (`/etc/fonts/conf.avail/local.conf`) and replace `Lato` with the font of your choice:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <!-- Load local system customization file -->
    <match target="pattern">
        <test qual="any" name="family"><string>Ubuntu</string></test>
        <edit name="family" mode="assign" binding="same"><string>Lato</string></edit>
    </match>
    <include ignore_missing="yes">local.conf</include>
</fontconfig>
```

### Prevent DejaVu family of fonts from interfering with emoji display <!-- omit in toc -->

Installing `twemoji-color-font` and optionally editing `$HOME/.config/fontconfig/56-twemoji-color.conf` to replace the Bitstream Vera family of fonts with other suitable fonts, such as Noto Serif, Ubuntu, and Cascadia Code. The browser font settings should also be changed to match the settings in the configuration file for best results.

***Note:*** This will only work for Mozilla apps.

> The font uses the SVG-in-OpenType format and will currently only show color emoji in Firefox, Thunderbird and other Mozilla Gecko-based applications. This is not a limitation of the font, but of the operating systems and applications. Regular B&W outline emoji are included for backwards/fallback compatibility. -- 13rac1

- <https://github.com/eosrei/twemoji-color-font>
- <https://www.reddit.com/r/firefox/comments/ev92yz/prevent_dejavu_font_from_messing_with_emojis/>
- <https://wiki.archlinux.org/index.php/Font_configuration#Replace_or_set_default_fonts>
- <https://askubuntu.com/a/740649/714808>

### KDE <!-- omit in toc -->

#### Taking screenshots

Install Spectacle from the app store. Screenshot location can be configured in the settings.

#### Customising KDE's appearance with Latte Dock

- <https://www.dedoimedo.com/computers/plasma-global-menu-app-title-window-buttons-like-mac-unity.html>
- <https://www.dedoimedo.com/computers/plasma-look-like-mac.html>

#### [Missing network manager](https://askubuntu.com/a/963902/714808)

Install the package:

```sh
sudo apt-get install plasma-nm
```

### [Font management](https://askubuntu.com/a/371320/714808) <!-- omit in toc -->

Install [font-manager](https://packages.ubuntu.com/focal/font-manager)

```sh
sudo apt-get install font-manager
```

</details>

## LaTeX

<details>
<summary>
Click to expand
</summary>

### ModernCV <!-- omit in toc -->

***Note: This package has not been updated since 2016***

#### Known issues <!-- omit in toc -->

- main `.tex` file: Some font shapes were not available, defaults substituted
- `fontenc.sty`: Font shape 'TU/qpl/m/n' undefined \ (Font) using 'TU/lmr/m/n' instead
- `moderncvbodyiii.sty`: You have requested package 'moderncvbodyiii', but the package provides 'moderncvbodyiii'.
- `moderncvheadiii.sty`: You have requested package 'moderncvheadiii', but the package provides 'moderncvheadiii'.

#### [Extending a quote's width](https://tex.stackexchange.com/a/247503/140109) <!-- omit in toc -->

```latex
% preamble
\let\originalrecomputecvlengths\recomputecvlengths
\renewcommand*{\recomputecvlengths}{%
\originalrecomputecvlengths%
\setlength{\quotewidth}{.8\textwidth}} % change .8 to desired value
```

#### [Edit space after header](https://tex.stackexchange.com/a/82871/140109) <!-- omit in toc -->

```latex
\makecvtitle
\vspace*{-5mm} % enter right after \makecvtitle
```

#### [Reduce signature whitespace](https://tex.stackexchange.com/a/196910/140109) <!-- omit in toc -->

```latex
% preamble
\patchcmd{\makeletterclosing}{[3em]}{[1em]}{}{}
```

### Bibliography patches <!-- omit in toc -->

To remove empty parentheses if year not provided for `@online`:

```latex
\usepackage{xpatch}
\xpatchbibdriver{online}
{\printtext[parens]{\usebibmacro{date}}}
{\iffieldundef{year}{}{\printtext[parens]{\usebibmacro{date}}}}
{}{}
```

Prioritising DOI or eprint over URL, if present:

- if DOI is not present, print eprint; if eprint is not present, print URL

```latex
\renewbibmacro*{doi+eprint+url}{%
    \printfield{doi}
    \newunit\newblock
    \newunit\newblock
    \iffieldundef{doi}{%
        \usebibmacro{eprint}
        \iffieldundef{eprint}{%
            \usebibmacro{url+urldate}}}
    {}
}
```

Removes unwanted fields for all reference types, except `@misc`:

```latex
\AtEveryBibitem{%
    \ifboolexpr{not (test {\ifentrytype{misc}})}%
    {\clearfield{issn}}{}
}
```

- [supress patching footnotes failed warning](https://tex.stackexchange.com/a/202994/140109)

```latex
\usepackage{silence} % suppress warning below
\WarningFilter{biblatex}{Patching footnotes failed}
```

### `hyperxmp` <!-- omit in toc -->

```latex
\def\licenseurl{https://www.latex-project.org/lppl/lppl-1-3c/} % license URL
\def\copyright{Copyright \textcopyright~\the\year{}~by Author. Licensed under the LPPL, version 1.3c.} % copyright information
\usepackage{hyperxmp}
\hypersetup{pdfcopyright=\copyright,pdflicenseurl=\licenseurl,pdfcontactemail=email@mail.com}
```

### Force table captions to top of the table <!-- omit in toc -->

```latex
\usepackage{floatrow}
\floatsetup[table]{capposition=top}
```

### Ensuring bibliography respects margins and [fix `underfull \hbox` warnings](https://tex.stackexchange.com/a/10928/140109) <!-- omit in toc -->

```latex
\appto{\bibsetup}{\sloppy}
\usepackage{etoolbox}
\apptocmd{\sloppy}{\hbadness 10000\relax}{}{}
```

### Change title of contents <!-- omit in toc -->

```latex
\usepackage[UKenglish]{babel} % UK English language
\addto\captionsUKenglish{\renewcommand\contentsname{Table of Contents}} % specify new title
```

### [Float placeins within subsections](https://tex.stackexchange.com/a/118667/140109) <!-- omit in toc -->

```latex
\usepackage[section]{placeins}
\makeatletter
\AtBeginDocument{%
    \expandafter\renewcommand\expandafter\subsection\expandafter{%
        \expandafter\@fb@secFB\subsection
    }
}
\makeatother
```

### [Adding captions as a node in `tikzpicture`](https://tex.stackexchange.com/a/351672/140109) <!-- omit in toc -->

[`tikzpagenodes`](https://tex.stackexchange.com/a/386331/140109)

### Change date format to DD/MM/YYYY <!-- omit in toc -->

```latex
\usepackage[UKenglish]{babel}
\usepackage[ddmmyyyy]{datetime} % set date format
```

### Rename "Chapter X" to "Part X" <!-- omit in toc -->

```latex
\addto\captionsUKenglish{\renewcommand{\chaptername}{Part}} % specify new name
```

### Beamer <!-- omit in toc -->

#### [Adjust title page vertical spacing](https://tex.stackexchange.com/a/255335/140109) <!-- omit in toc -->

```latex
\makeatletter
\defbeamertemplate*{title page}{mydefault}[1][]{
    \begin{columns}
        \column{.22\paperwidth}% ADJUST
        \mbox{}
        \column{.78\paperwidth}% ADJUST
        \begin{beamercolorbox}[sep=0pt,left,#1]{author}
            \vskip1.5cm
            \usebeamerfont{author}\textcolor{white}\insertauthor
        \end{beamercolorbox}
        \vskip.7cm%<- added
        \begin{beamercolorbox}[sep=0pt,left,#1]{title}
            \usebeamerfont{title}\titlesize\inserttitle\par%
            \ifx\insertsubtitle\@empty%
            \else%
            \vskip0.25em%
            {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
            \fi%
        \end{beamercolorbox}%
        \vskip.25cm\par
        \begin{beamercolorbox}[sep=0pt,left,#1]{date}
            \usebeamerfont{date}\footnotesize\date
        \end{beamercolorbox}\vskip.25em
        \begin{beamercolorbox}[sep=0pt,left,#1]{email}
            \usebeamerfont{email}\href{mailto:email@mail.com}{\texttt{\textcolor{white}email@mail.com}}
        \end{beamercolorbox}
    \end{columns}}
\setbeamertemplate{title page}[mydefault][colsep=-4bp,rounded=true,shadow=\beamer@themerounded@shadow,wd=9.5cm]% ADJUST
\makeatother
```

#### [Frame title formatting](https://tex.stackexchange.com/a/306416/140109) <!-- omit in toc -->

```latex
\makeatletter %
\setbeamertemplate{frametitle}{
    \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
    \@tempdima=\textwidth%
    \advance\@tempdima by\beamer@leftmargin%
    \advance\@tempdima by\beamer@rightmargin%
    \vspace{.5cm} % ADJUST
    \hspace*{.5cm} % ADJUST
    \begin{beamercolorbox}[sep=.3cm,left,wd=\the\@tempdima]{frametitle}
        \usebeamerfont{frametitle}%
        \vbox{}\vskip-1ex%
        \if@tempswa\else\csname beamer@ftecenter\endcsname\fi%
        \strut\underline{\insertframetitle}\strut\par%
        {%
            \ifx\insertframesubtitle\@empty%
            \else%
            {\usebeamerfont{framesubtitle}\usebeamercolor[fg]{framesubtitle}\insertframesubtitle\strut\par}%
            \fi
        }%
        \vskip-1ex%
        \if@tempswa\else\vskip-.3cm\fi% set inside beamercolorbox... evil here...
    \end{beamercolorbox}}
\makeatother
```

#### [Frame margins](https://tex.stackexchange.com/a/109984/140109) <!-- omit in toc -->

```latex
\setbeamertemplate{footline}{%
    \vspace{.4cm}
}
```

#### Beamer colours <!-- omit in toc -->

```latex
\definecolor{darkblue}{HTML}{050F42} % custom HTML colour
\usecolortheme[named=blue]{structure} % set theme colour
\setbeamertemplate{section in toc}{%
    {\color{blue}\inserttocsectionnumber.}~{\color{blue}\textbf{\inserttocsection}}}
\setbeamertemplate{subsection in toc}{%
    \hspace{2em}{\color{logoblue}\rule[0.3ex]{3pt}{3pt}}~\inserttocsubsection\par}
\setbeamercolor{title}{fg=white}
\setbeamercolor{date}{fg=white}
\setbeamercolor{frametitle}{fg=darkblue}
\setbeamercolor{normal text}{fg=darkblue}
\setbeamercolor{example text}{fg=blue}
```

#### [Change position of navigation symbols](https://tex.stackexchange.com/a/35637/140109) <!-- omit in toc -->

```latex
\hskip1em\usebeamercolor[fg]{navigation symbols dimmed}%
    \insertslidenavigationsymbol%
    \insertframenavigationsymbol% %
    \insertsectionnavigationsymbol%
    \insertsubsectionnavigationsymbol%
    \insertdocnavigationsymbol%
    \insertbackfindforwardnavigationsymbol
```

### Sans serif headings with serif body and math <!-- omit in toc -->

```latex
\usepackage{lmodern} % latin modern
\usepackage{mathpazo} % mathpazo font for body + math
\usepackage{sectsty} % for setting section headings to sans serif
\allsectionsfont{\raggedright\normalfont\sffamily\bfseries} % ^ bold + sans serif section headings; aligned left
```

</details>

## [Pandoc](https://pandoc.org/)

<details>
<summary>
Click to expand
</summary>

### Syntax highlighting <!-- omit in toc -->

Content fenced by three backticks (\`) will be parsed as codeblocks. If a language is not specified after the first three backticks, Pandoc parses the content into the `verbatim` environment on LaTeX. This prevents the codeblock from being formatted using the default syntax highlighting settings (including background colour). To prevent this from happening, assign these code blocks markup languages such as `html` or `md`.

Allowing syntax highlighting of inline code (refs: [1](https://stackoverflow.com/a/54669722/4573584), [2](https://stackoverflow.com/a/34481948/4573584)):

```latex
% preamble - required packages
\usepackage{xcolor}
\definecolor{bgcolor}{HTML}{f0f8ff}
% set background colour
\let\oldtexttt\texttt
\renewcommand{\texttt}[1]{
  \colorbox{bgcolor}{\oldtexttt{#1}}
}
```

### Markdown to Beamer <!-- omit in toc -->

[The Easiest Way to Make Presentations! (Pandoc + Markdown)](https://www.youtube.com/watch?v=dum7q6UXiCE) by Luke Smith on YouTube

[Pandoc command](https://pandoc.org/demos.html):

```sh
pandoc -t beamer file.md -o file.pdf
```

[YAML metadata](https://pandoc.org/MANUAL.html#variables-for-beamer-slides):

```yml
---
aspectratio:
  - 169
title:
  - Title
subtitle:
  - Subtitle
author:
  - Author
subject:
  - Subject
date:
  - \today
theme:
  - Madrid
colortheme:
  - beaver
keywords:
  - random
  - notes
---
```

### Markdown to PDF <!-- omit in toc -->

[Pandoc command](https://pandoc.org/demos.html)

```sh
pandoc file.txt --pdf-engine=pdflatex -o file.pdf
```

[YAML metadata](https://pandoc.org/MANUAL.html#variables-for-latex)

```yml
---
title:
  - Title
subtitle:
  - Subtitle
author:
  - Author
subject:
  - Subject
date:
  - \today
keywords:
  - random
  - notes
abstract:
  - Abstract.
documentclass:
  - article
fontfamily:
  - mathpazo
papersize:
  - a4
geometry:
  - top=25mm
  - left=25mm
  - right=25mm
  - bottom=25mm
---
```

Command line formatting and metadata:

- [Page title or title](https://groups.google.com/forum/#!msg/pandoc-discuss/CyiyBJOn5Gs/Olo3aq1qAi0J):

```sh
pandoc -s -V "pagetitle:My Doc Title" -V "title:My Doc Title"
```

- Today's date:

```sh
-M date="`date "+%B %e, %Y"`"
```

or

```sh
--metadata date="`date +%D`"
```

To obtain date formats:

```sh
date --help
```

### Markdown to reveal.js <!-- omit in toc -->

[Pandoc commands](https://pandoc.org/demos.html):

- For slides with math:

```sh
pandoc -s --mathjax -i -t revealjs SLIDES.txt -o example16d.html
```

```sh
pandoc -t revealjs -s habits.txt -o habits.html
```

[YAML metadata](https://pandoc.org/MANUAL.html#variables-for-html-slides):

```yml
---
revealjs-url:
  - https://revealjs.com/
title:
  - Title
author:
  - Author
date:
  - 20/04/2019
theme:
  - white
---
```

### [Input multiple files](https://gist.github.com/xuanlongma/5564190) <!-- omit in toc -->

```sh
pandoc -s input1.md input2.md input3.md -o output.html
```

</details>
