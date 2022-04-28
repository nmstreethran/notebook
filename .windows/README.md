# Windows

List of packages installed through `winget` (`.windows/pkgs-winget.json`):

```powershell
winget export --output .\.windows\pkgs-winget.json
# or
winget export -o .\.windows\pkgs-winget.json
```

Skyrim SE plugin list (`.windows/skyrimse-plugins.txt`) and load order (`.windows/skyrimse-loadorder.txt`) for mods managed with Vortex:

```powershell
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\yGZRItibI\plugins.txt .\.windows\skyrimse-plugins.txt
cp $HOME\AppData\Roaming\Vortex\skyrimse\profiles\yGZRItibI\loadorder.txt .\.windows\skyrimse-loadorder.txt
```

Windows Terminal settings are saved in `.windows/term-settings.json`.
