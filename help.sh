#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m' # no colour

found=false
xbindkeys="xbindkeys -k"
keycodes="${xbindkeys}
xev | grep 'keycode'
sudo showkey"
sevenzip="${CYAN}7zip extract${NC}
7z e filename
7z a archive.7z target_dir"

if [[ "$@" == "keys" || "$@" == "keycodes" ]]; then
  found=true
  printf "${CYAN}Get key codes${NC}\n"
  printf "${keycodes}\n"
fi

if [[ "$@" == "xbindkeys" ]]; then
  found=true
  printf "${CYAN}Get key codes${NC}\n"
  printf "${xbindkeys}\n"
  printf "${CYAN}Reload config${NC}\n"
  printf "xbindkeys -p\n"
fi

if [[ "$@" == "bash" || "$@" == "executable" ]]; then
  found=true
  printf "${CYAN}Make file executable${NC}\n"
  printf "chmod +x bin/help.sh\n"
fi

if [[ "$@" == "resolution" || "$@" == "xrandr" ]]; then
  found=true
  printf "${CYAN}Get resolution${NC}\n"
  printf "xrandr | grep '*'\n"
fi

if [[ "$@" == "sound" ]]; then
  found=true
  printf "${CYAN}List sound devices${NC}\n"
  printf "arecord -l\n"
  printf "${CYAN}GUI for sound${NC}\n"
  printf "pavucontrol\n"
  printf "${CYAN}Adjust volume${NC}\n"
  printf "amixer sset 'Master' 50%%\n"
fi

if [[ "$@" == "zsh" ]]; then
  found=true
  printf "${CYAN}Reload .zshrc${NC}\n"
  printf "source ~/.zshrc\n"
fi

if [[ "$@" == "gamepad" ]]; then
  found=true
  printf "${CYAN}Get button codes${NC}\n"
  printf "sdl2-jstest --test 0\n"
fi

if [[ "$@" == "benchmark" || "$@" == "unixbench" ]]; then
  found=true
  printf "${CYAN}Run UnixBench${NC}\n"
  printf "ubench\n"
fi

if [[ "$@" == "compression" ]]; then
  found=true
  printf "${sevenzip}\n"
fi

if [[ "$@" == "7zip" ]]; then
  found=true
  printf "${sevenzip}\n"
fi

if [[ "$@" == "wifi" || "$@" == "network" ]]; then
  found=true
  printf "${CYAN}Connect to wifi${NC}\n"
  printf "nmtui-connect\n"
fi

if [[ "$@" == "pacman" ]]; then
  found=true
  printf "${CYAN}Remove package + dependencies and configs${NC}\n"
  printf "pacman -Rns package_name\n"
  printf "${CYAN}Upgrade packages${NC}\n"
  printf "pacman -Syu\n"
fi

if [[ "$@" == "mount" ]]; then
  found=true
  printf "${CYAN}Mount drive${NC}\n"
  printf "mount drive_path dest_path\n"
  printf "${CYAN}Unmount drive${NC}\n"
  printf "umount drive_path\n"
fi

if [[ "$@" == "N64" || "$@" == "mupen" ]]; then
  found=true
  printf "${CYAN}Run Mupen64plus${NC}\n"
  printf "Mupen64plus rom_path\n"
fi

if [[ "$@" == "playstation" || "$@" == "ps" ]]; then
  found=true
  printf "${CYAN}Run pcsxr${NC}\n"
  printf "pcsxr\n"
fi

if [[ "$@" == "battery" ]]; then
  found=true
  printf "${CYAN}Run acpi${NC}\n"
  printf "acpi\n"
fi

if [[ "$found" == false ]]; then
  printf "Nothing found...\n"
fi




#options=("Option 1" "Option 2" "Quit")
#select opt in "${options[@]}"
#do
#    case $opt in
#        "Option 1")
#            echo "you chose choice 1"
#            ;;
#        "Option 2")
#            echo "you chose choice 2"
#            ;;
#        "Quit")
#            break
#            ;;
#        *) echo invalid option;;
#    esac
#done
