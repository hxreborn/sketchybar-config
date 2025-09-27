# Utility Bar - Rosé Pine Moon

> Personal fork of [Kcraft059/sketchybar-config](https://github.com/Kcraft059/sketchybar-config)

<div align=center>
<img width="1470" alt="Personal SketchyBar Configuration" src="https://private-user-images.githubusercontent.com/32096750/486206391-d0d85f07-1bef-4d4d-bfdd-396804c96048.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTcxMDIwNzIsIm5iZiI6MTc1NzEwMTc3MiwicGF0aCI6Ii8zMjA5Njc1MC80ODYyMDYzOTEtZDBkODVmMDctMWJlZi00ZDRkLWJmZGQtMzk2ODA0Yzk2MDQ4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA5MDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwOTA1VDE5NDkzMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWQzMzhjYTIxNDE5ZWFhZDk0YWNjYzJjYTk0OGQxMjZhMGMxZWY2ZjNmY2U2ZTBiNGQwNWY4ZjM0NDJkNTNmMmMmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Rt0omstx-MSX-qiOIeqPLM0WZgl3KmuC-_h9u8Bp_M4" />

</div>


This is a config I made which aggregate functionnality and aesthetics, made in mind to be Nix-Compliant.

See https://github.com/FelixKratz/SketchyBar/discussions/47?sort=new#discussioncomment-14058252

> [!WARNING] 
> Some of the functionnalities of the bar are not working currently in MacOS Tahoe.
> This implies that: Space switching might not work properly, some menu items won't trigger and be removed from the macos native menubar when trying to trigger those, wifi won't be able to show SSID and will instead show \<redacted\> ([issue](<https://developer.apple.com/forums/thread/763051>)), and other not yet tested bugs might occur.

## A little demonstration of the functionalities :

<img width="2940" height="1912" alt="Screenshot 2025-08-09 at 18 49 42" src="https://github.com/user-attachments/assets/23066c77-1b31-4372-a737-8bf450af1d80" />
<img width="2940" height="1912" alt="Screenshot 2025-08-09 at 18 55 12" src="https://github.com/user-attachments/assets/0406413d-4468-4ba7-b55d-1c59e7e52cfb" />


https://github.com/user-attachments/assets/c9db52a4-d7fe-4daa-a904-cd201476556c

## Install :

With the installer :

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/hexpreso/sketchybar-config/main/install.sh)"
```

<details>

<summary>Manual install:</summary>

Install sketchybar

```bash
brew tap FelixKratz/formulae
brew install sketchybar
brew services start sketchybar
```

Install this config with its dependencies

```bash
# brew install yabai # Recommended only if you already have a config
# brew install brew install waydabber/betterdisplay/betterdisplaycli # Recommended if using better display Configure [here](<plugins/display/script.sh>)
# (Also recommended for battery control - when clicking battery icon : https://github.com/mhaeuser/Battery-Toolkit)

brew install media-control macmon imagemagick
brew install --cask font-SF-Pro font-sketchybar-app-font

mkdir -p ~/.config
cd ~/.config/
git clone https://www.github.com/hexpreso/sketchybar-config sketchybar

sketchybar --reload
```

For yabai users : `yabai -m config external_bar all:36:0`

</details>

For Nix-Darwin users see : [here](#nix--nix-darwin-integration)
or alternatively https://github.com/Kcraft059/Nix-Config/blob/master/home/darwin/sketchybar.nix

> [!NOTE]
> Aerospace isn't yet supported, if you wanna implement it see : https://github.com/FelixKratz/SketchyBar/discussions/47?sort=new#discussioncomment-14081291

## Configuration

A lightweight `config.sh` (or an externally provided file via the `SKETCHYBAR_CONFIG` env var) now allows you to tweak common behaviors without patching the repo.

Defaults (only apply if a variable is unset):

```bash
NOTCH_WIDTH=180       # Reserved width for the display notch
MUSIC_INFO_WIDTH=80   # Width (px) for music title & subtitle labels
CPU_UPDATE_FREQ=2     # Seconds between CPU graph samples
```

Usage order of precedence:
1. If `SKETCHYBAR_CONFIG` points to a readable file, it is sourced.
2. Else if `config.sh` exists in the repo directory, it is sourced (see exmaples in ./config-examples/).
3. Fallback defaults are applied inside `sketchybarrc`.

You can remove or comment variables you don't want to override—defaults remain unaffected.

### Adding a custom theme 

In the config.sh, you can choose the theme used for the bar :

```bash
COLOR_SCHEME="rosepine-moon"
```

You can also set your own theme by adding a theme.sh file, or by specifying the path to the theme file :

```bash
COLOR_SCHEME="my-theme"
THEME_FILE_PATH="$HOME/.config/sketchybar-config/theme.sh"
```

The file must follow the format in the example (./config-examples)

### Adjusting for the Notch or Clipping Music
If album/title text appears clipped by the notch, increase either:
- `NOTCH_WIDTH` (reserves more center space), or
- `MUSIC_INFO_WIDTH` (shrinks / expands label region; smaller can prevent collision with other center items).

Reload after changing values: `sketchybar --reload` (tip you can also ⇧+click on the cloverleaf logo to reload the config directly from the bar).

## Nix / Nix-Darwin Integration
There are multiple ways to integrate these settings through Nix flakes.

### 1. Flake Input 
```nix
{
  inputs.sketchybar-config.url = "github:kcraft059/sketchybar-config";
  # ...
}
```
Then deploy the repo content into `~/.config/sketchybar` (via home-manager or a derivation) and drop a `config.sh` alongside.

#### Example Home-Manager Module Snippet
An opinionated module integrating this repo as a flake input and enabling the bar conditionally:
```nix
{ config, inputs, pkgs, lib, ... }:
{
  options.home-config.status-bar = {
    enable = lib.mkEnableOption "Whether to enable the Custom Menu-Bar service";
  };

  config = lib.mkIf config.home-config.status-bar.enable {
    home.packages = with pkgs; [
      sketchybar-app-font
      # menubar-cli # (needs to come from an overlay, check https://github.com/Kcraft059/Nix-Config/blob/master/overlays/menubar-cli.nix for implementation - bin by @FelixKratz) 
    ];

    programs.sketchybar = {
      enable = true;
      service = rec {
        enable = true;
        errorLogFile = "/tmp/sketchybar.log";
        outLogFile = errorLogFile;
      };
      configType = "bash";
      config = {
        source = "${inputs.sketchybar-config}"; # flake input path
        recursive = true; # copy entire tree
      };
      extraPackages = with pkgs; [
        # menubar-cli # see above
        imagemagick
        macmon
      ];
    };

    # Example of providing dynamic icon map or other generated files
    xdg.configFile = {
      "sketchybar/dyn-icon_map.sh".source = "${pkgs.sketchybar-app-font}/bin/icon_map.sh";

      # Optional: inline user overrides without forking
      # "sketchybar/config.sh".text = ''
      #   NOTCH_WIDTH=200
      #   MUSIC_INFO_WIDTH=100
      # '';
    };

  };
}
```

## Troubleshooting
- CPU not showing: Ensure `cpu.sh` is sourced (it is by default) and run `sketchybar --query item graph.percent` to verify presence.
- Music overlapping notch: Bump `NOTCH_WIDTH` in small increments (e.g. +10) or reduce `MUSIC_INFO_WIDTH`.
- Config not applied: Echo inside your `config.sh` or run `grep NOTCH_WIDTH ~/.config/sketchybar/sketchybarrc` to confirm dynamic variable usage.
