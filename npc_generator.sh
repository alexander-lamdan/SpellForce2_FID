#!/usr/bin/env bash
echo -e "Hey, this is script generator for SpellForce Lua Scripts if you're trying to modding your units in editor, and you don't wan't to write a lot of copy-paste code. This script is best offer for lazy ass like me :D\n\n I will do this script in the future in languages as JavaScript + Node.js, PHP and maybe I will add C, C++, Rust and C#, it all about maybe. But hey, you can do it for your own. Take it as template and do it. For free.\n\n"

echo -e "Please enter the npc name that you created in the map editor\n"

read NPC_FILENAME

echo -e "How much NPC's you created in the map that need to be spawned?\n"

read NPC_COUNT

echo -e "What is the name of main script for our NPC?\n"

read MAIN_SCRIPT

LUA_MAIN_SCRIPT="dofile(GetScriptPath()..\"$MAIN_SCRIPT.lua\")"

echo "$LUA_MAIN_SCRIPT"
# continue to work on that script
