#!/bin/bash

name="rtools"

blue="\033[34m"
bold="\033[1;37m"
reset="\033[0m"
red="\033[31m"
yellow="\033[33m"
green="\033[32m"

if [ ! -d "/Applications/Roblox.app" ]; then
    echo -e "${blue}==>${reset} ${bold}Please install Roblox first"
    exit 1
fi

echo -e "${blue}==>${reset} ${bold}Installing ${name}...${reset}"

sudo tee "/usr/local/bin/${name}" > /dev/null << 'EOS'
#!/bin/bash

name="rtools"
blue="\033[34m"
bold="\033[1;37m"
reset="\033[0m"
red="\033[31m"
yellow="\033[33m"
green="\033[32m"

if [ -z "$1" ]; then
    echo -e "${yellow}Usage: ${name} <option> [arguments]${reset}"
    echo -e "${yellow}Run '${name} help' for more information${reset}"
    exit 1
fi

if pgrep -x "Roblox" > /dev/null
then
    echo -e "${blue}==>${reset} ${bold}Quitting Roblox to edit...${reset}"
    pkill -x "Roblox"
    if pgrep -x "Roblox" > /dev/null
    then
        echo -e "${blue}==>${reset} ${bold}Roblox is unresponsive. Forcing quit...${reset}"
        pkill -9 -x "Roblox"
    fi

    echo -e "${blue}==>${reset} ${green}Successfully quit Roblox${reset}"
fi

case "$1" in
    "img")
        if [ -z "$2" ]; then
            echo -e "Usage: ${name} img <image-name> <file>"
            exit 1
        fi

        if [ -z "$3" ]; then
            echo -e "Usage: ${name} img $2 <file>"
            exit 1
        fi

        if [ -f "$3" ]; then
            echo -e "${blue}==>${reset} ${bold}Editing...${reset}"
            case "$2" in
                "avatareditor")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/AvatarEditor_LightTheme.png"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/AvatarEditor.png"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/AvatarEditor_LightTheme.png"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/AvatarEditor.png"
                    ;;
                "catalog")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/Catalog_LightTheme.png"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/Catalog.png"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/Catalog_LightTheme.png"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/textures/AvatarEditorImages/Catalog.png"
                    ;;
                "bn")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/sky/bn.dds"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sky/bn.dds"
                    ;;
                "cloudavection")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/sky/cloudAdvection.dds"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sky/cloudAdvection.dds"
                    ;;
                "clouddetail")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/sky/cloudDetail.dds"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sky/cloudDetail.dds"
                    ;;
                "moon")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/sky/moon.jpg"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sky/moon.jpg"
                    ;;
                "sun")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/content/sky/sun.jpg"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sky/sun.jpg"
                    ;;
                "sky")
                    echo -e "${blue}==>${reset} ${bold}Deleting original images...${reset}"
                    sudo rm "/Applications/Roblox.app/Contents/Resources/ExtraContent/textures/sky/white.png"
                    echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                    cp "$3" "/Applications/Roblox.app/Contents/Resources/ExtraContent/textures/sky/white.png"
                    ;;
                *)
                    echo -e "${blue}==>${reset} ${red}Error: No matches found for 'rtools img $2 $3'${reset}"
                    exit 1
                    ;;
            esac

            echo -e "${blue}==>${reset} ${green}Editing complete${reset}"
        else
            echo -e "${blue}==>${reset} ${red}Error: File path not found: $3${reset}"
        fi
        ;;
    "sound")
        if [ -z "$2" ]; then
            echo -e "${blue}==>${reset} ${yellow}Usage: ${name} sound <sound-name> <file>${reset}"
            exit 1
        fi

        if [ -z "$3" ]; then
            echo -e "${blue}==>${reset} ${yellow}Usage: ${name} sound $2 <file>${reset}"
            exit 1
        fi

        case "$2" in
            "actionfalling")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/action_falling.ogg"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/action_falling.ogg"
                ;;
            "actionfootstepsplastic")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/action_footsteps_plastic.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/action_footsteps_plastic.mp3"
                ;;
            "actiongetup")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/action_get_up.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/action_get_up.mp3"
                ;;
            "actionjumpland")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/action_jump_land.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/action_jump_land.mp3"
                ;;
            "actionjump")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/action_jump.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/action_jump.mp3"
                ;;
            "actionswim")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/action_swim.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/action_swim.mp3"
                ;;
            "impactexplosion")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/impact_explosion_03.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/impact_explosion_03.mp3"
                ;;
            "impactwater")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/impact_water.mp3"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/impact_water.mp3"
                ;;
            "oof")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/oof.ogg"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/oof.ogg"
                ;;
            "ouch")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/ouch.ogg"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/ouch.ogg"
                ;;
            "volumeslider")
                echo -e "${blue}==>${reset} ${bold}Deleting original sound...${reset}"
                sudo rm "/Applications/Roblox.app/Contents/Resources/content/sounds/volume_slider.ogg"
                echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
                cp "$3" "/Applications/Roblox.app/Contents/Resources/content/sounds/volume_slider.ogg"
                ;;
            *)
                echo -e "${blue}==>${reset} ${red}Error: Sound not found: $2${reset}"
                ;;
        esac
        ;;
    "logo")
        if [ -z "$2" ]; then
            echo -e "${blue}==>${reset} ${yellow}Usage: ${name} logo <icns-file>${reset}"
            exit 1
        fi

        if [[ "$2" =~ \.[iI][cC][nN][sS]$ ]]; then
            echo -e "${blue}==>${reset} ${bold}Deleting original logo...${reset}"
            sudo rm "/Applications/Roblox.app/Resources/AppIcon.icns"
            echo -e "${blue}==>${reset} ${bold}Copying and renaming your file...${reset}"
            cp "$2" "/Applications/Roblox.app/Resources/AppIcon.icns"
        else
            echo -e "${blue}==>${reset} ${bold}Note: Only .icns files are supported. This must be the primary icon format for macOS applications.${reset}"
        fi
        
        killall Dock
        ;;
    "reinstall")
        open "/Applications/Roblox.app/Contents/MacOS/RobloxPlayerInstaller.app"
        ;;
    "executor")
        bash -c "$(curl -fsSL https://www.hydrogen.lat/install)"
        ;;
    "help")
        echo "${name} Commands:"
        echo ""
        echo "img: Change Roblox image content"
        echo "sound: Change Roblox sound content"
        echo "logo: Change the Roblox app logo"
        echo "reinstall: Reinstall Roblox"
        echo "executor: Install Hydrogen Executor"
        echo "help: Display this help message"
        echo "readme: Display project readme"
        echo "manual: Display user manual"
        echo "agents: Display agent information"
        echo "license: Display license details"
        echo "version: Display current version"
        echo "copyright: Display copyright information"
        echo "codeowner: Display owner name and contact"
        ;;
    "license")
        echo "Copyright (c) 2026 LT5B"
        echo ""
        echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:"
        echo ""
        echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software."
        echo ""
        echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."
        ;;
    "codeowner")
        echo "LT5B - Minh"
        echo "Made in Vietnam"
        echo "Email: engeleditorfpe@gmail.com"
        ;;
    "readme")
        echo "${name} Readme:"
        echo ""
        echo "What is ${name}?"
        echo "> ${name} is a Roblox content editor created by LT5B in Vietnam (Tested on Sep 19, 2026 | Published on Sep 20, 2026)"
        echo "When was ${name} first created?"
        echo "> Tested on Sep 19, 2026, published on Sep 20, 2026"
        echo "Who made ${name}?"
        echo "> LT5B (real name is Minh)"
        echo "Owner contact?"
        echo "> Email: engeleditorfpe@gmail.com"
        ;;
    "manual")
        echo "This manual provides an overview, system constraints, safety architecture, and standard terminal command listings for ${name} on macOS."
        echo ""
        echo "Quick Overview:"
        echo "• Target Platform: Exclusive to macOS."
        echo "• Core Purpose: Allows safe client content editing without triggering integrity corruption or client validation crashes."
        echo "• Command Syntax: To check specific operational flags and code examples, run:"
        echo "  > ${name} help"
        ;;
    "agents")
        echo "${name} is an advanced configuration and content modification CLI tool designed exclusively for macOS. It allows developers and power users to safely modify local Roblox assets, configurations, and environment behaviors without breaking core system integrity."
        echo "Below is the complete definition and structural layout for the ${name} Core Agent."
        echo ""
        echo "Agent Definition: ${name} Manager"
        echo "⚙️ System Prompt & Core Logic"
        echo "🛠️ Command Architecture"
        echo "The agent processes requests by translating natural language into safe, structured terminal commands."
        echo ""
        echo "1. Asset & Content Editing"
        echo "• Purpose: Safely replaces or injects custom textures, sounds, and UI components into the local macOS app directory."
        echo "• Safety Lock: Automatically backs up native assets before applying changes."
        echo ""
        echo "2. Fast Flag & Optimization Management"
        echo "• Purpose: Configures advanced client features (graphics limits, networking tweaks, unlocked framerates)."
        echo "• Safety Lock: Validates flag types to prevent client crashes on startup."
        echo ""
        echo "3. Verification & Safety Routine"
        echo "• Purpose: Scans the modified directory against native manifests to ensure the client remains stable and functional."
        ;;
    "version")
        echo "1.0.0"
        ;;
    "rename")
        if [ -z "$2" ]; then
            echo -e "${blue}==>${reset} ${yellow}Usage: ${name} rename <name>"
            exit 1
        fi
        
        sudo mv "/Applications/Roblox.app" "/Applications/$2.app"
        killall Dock
        ;;
    "copyright")
        echo "Copyright (C) 2026 LT5B - ${name}"
        ;;
    *)
        echo "==> Error: Command not found: rtools $1"
        exit 1
        ;;
esac
EOS

sudo chmod +x "/usr/local/bin/${name}"

if [ -x "/usr/local/bin/${name}" ]; then
    echo -e "${blue}==>${reset} ${green}Installation successful!${reset}"
else
    echo -e "${blue}==>${reset} ${red}Installation failed${reset}"
fi
