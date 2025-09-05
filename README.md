# Utility Bar - Rosé Pine Moon

> Personal fork of [Kcraft059/sketchybar-config](https://github.com/Kcraft059/sketchybar-config)

<div align=center>
<img width="1470" alt="Personal SketchyBar Configuration" src="https://private-user-images.githubusercontent.com/32096750/486206391-d0d85f07-1bef-4d4d-bfdd-396804c96048.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTcwOTI2MjIsIm5iZiI6MTc1NzA5MjMyMiwicGF0aCI6Ii8zMjA5Njc1MC80ODYyMDYzOTEtZDBkODVmMDctMWJlZi00ZDRkLWJmZGQtMzk2ODA0Yzk2MDQ4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA5MDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwOTA1VDE3MTIwMlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTA0N2FjNTlkYzhmZjQwYmFhYTVjZmYzYjllZTQxOWM2YTUyNjU0ZmVhMGE4YmU5MWMyNGFjOTA5OTc0NTU3YTAmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.JeGqKFtWQJnV-LoS_05qGznOVX_Zkm9rjuULMpnDrOw" />

</div>


This is a config I made which aggregate functionnality and aesthetics.

See https://github.com/FelixKratz/SketchyBar/discussions/47?sort=new#discussioncomment-14058252

> [!WARNING] 
> Some of the functionnalities of the bar are not working currently in MacOS Tahoe.

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

For Nix-Darwin users see : https://github.com/Kcraft059/Nix-Config/blob/master/home/darwin/sketchybar.nix

> [!NOTE]
> Aerospace isn't yet supported, if you wanna implement it see : https://github.com/FelixKratz/SketchyBar/discussions/47?sort=new#discussioncomment-14081291

## A little demonstration of the functionalities :

<img width="2940" height="1912" alt="Screenshot 2025-08-09 at 18 49 42" src="https://github.com/user-attachments/assets/23066c77-1b31-4372-a737-8bf450af1d80" />
<img width="2940" height="1912" alt="Screenshot 2025-08-09 at 18 55 12" src="https://github.com/user-attachments/assets/0406413d-4468-4ba7-b55d-1c59e7e52cfb" />


https://github.com/user-attachments/assets/c9db52a4-d7fe-4daa-a904-cd201476556c
