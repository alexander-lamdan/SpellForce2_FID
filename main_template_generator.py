#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Need to think about better option for this template generator.
# I need to add more options for this
import pathlib
import os

lua_map_name = input("Please enter the map name you need\n")
lua_template = '''State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions =
		{
	    	-- fill_me
		},
		Actions =
		{

		},
		GotoState = "MAIN",
	},
};

State
{
	StateName = "MAIN",

	OnOneTimeEvent
	{
		Conditions =
		{
		    -- fill_me
		},
		Actions =
		{
            -- fill_me
		},
	},

};\n
'''
with open(lua_map_name + '.lua','w') as file:
	file.write(lua_template)
print(f'The file {lua_map_name} is created\n')
