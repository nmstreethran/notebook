# Visual Studio Code notes <!-- omit in toc -->

## Table of contents <!-- omit in toc -->

- [Keyboard shortcuts](#keyboard-shortcuts)
- [Additional keybindings](#additional-keybindings)
  - [Making selected text uppercase or lowercase](#making-selected-text-uppercase-or-lowercase)
- [Settings](#settings)
- [Syntax highlighting](#syntax-highlighting)
- [Useful links](#useful-links)
- [Python](#python)
- [Git](#git)
- [Markdown](#markdown)
- [HTML](#html)

## [Keyboard shortcuts](https://vslive.com/Blogs/News-and-Tips/2015/04/5-VS-Keyboard-Shortcuts.aspx)

View all keyboard shortcuts in VS Code using `Ctrl+K+S`

Useful shortcuts:

- Move Code: `Alt+Up` / `Alt+Down`
- Create Collapsible Region: `Ctrl+M+H` / `Ctrl+M+U`
- Comment / uncomment Code Block: `Ctrl+K+C` / `Ctrl+K+U`
- Peek Definition: `Alt+F12`
- Navigate Forward / Backward: `Ctrl+–` / `Ctrl+Shift+–`
- [Add cursors to all line ends in current selection](https://stackoverflow.com/a/46244456/4573584): `Alt+Shift+I`

## Additional keybindings

### [Making selected text uppercase or lowercase](https://stackoverflow.com/a/41688564/4573584)

Go to Keyboard Shortcuts (`ctrl+k` `ctrl+s`) and paste the following in `keybindings.json`:

```json
[
 {
    "key": "ctrl+shift+u",
    "command": "editor.action.transformToUppercase",
    "when": "editorTextFocus"
 },
 {
    "key": "ctrl+shift+l",
    "command": "editor.action.transformToLowercase",
    "when": "editorTextFocus"
 }
]
```

`ctrl+shift+l` and `ctrl+shift+u` might cause conflicts or not work at all, so use other keys, such as `ctrl+alt+l` and `ctrl+alt+u` respectively.

## Settings

See my [gist](https://gist.github.com/nmstreethran/b63189f4af0c9d444691105ab456e943).

## Syntax highlighting

[Manually set the language for syntax highlighting for a file opened on VS Code](https://stackoverflow.com/a/30776845/4573584):

> In the very right bottom corner, left to the smiley there was the icon saying "Plain Text". When you click it, the menu with all languages appears where you can choose your desired language.

## Useful links

- [Key Bindings for Visual Studio Code](https://code.visualstudio.com/docs/getstarted/keybindings)
- [Keyboard shortcuts for Windows](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)
- [Multi-root Workspaces](https://code.visualstudio.com/docs/editor/multi-root-workspaces)

## Python

- [Python in Visual Studio Code](https://code.visualstudio.com/docs/languages/python#_install-python-and-the-python-extension)
- [Getting Started with Python in VS Code](https://code.visualstudio.com/docs/python/python-tutorial)
- [Working with Jupyter Notebooks in Visual Studio Code](https://code.visualstudio.com/docs/python/jupyter-support)

## Git

- [Using Version Control in VS Code](https://code.visualstudio.com/Docs/editor/versioncontrol)

## Markdown

- [Markdown and Visual Studio Code](https://code.visualstudio.com/docs/languages/markdown)

## HTML

- [HTML in Visual Studio Code](https://code.visualstudio.com/docs/languages/html)
