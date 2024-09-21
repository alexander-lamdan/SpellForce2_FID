#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import pathlib

print("Hey, this is script generator for SpellForce Lua Scripts if you're trying to modding your units in editor, and you don't wan't to write a lot of copy-paste code. This script is best offer for lazy ass like me :D\n\n I will do this script in the future in languages as JavaScript + Node.js, PHP, Bash and maybe I will add C, C++, Rust and C#, it all about maybe. But hey, you can do it for your own. Take it as template and do it. For free.\n\n")

npc_map_name = input("What is the name of your npc that you create in editor?\n")
npc_count = int(input("How much npc your created in the map?\n"))
main_script = input("Enter the main script filename that will be in the npc file you generate:\n")
counter = 0
lua_command = f'dofile(GetScriptPath().."{main_script}.lua")'


while npc_count > counter:

  counter += 1
  generated_npc = f'{npc_map_name}{counter}.lua'

  with open(generated_npc,'w') as file:
	  file.write(lua_command)
  print(f'Your file {generated_npc} is created')
