<?php
#!/usr/bin/env php8.2
$npc_name = (string)readline("What is the name of your npc that you create in editor? ");
$npc_count = (int)readline("How much npc your created in the map? ");
$main_spawn_script = (string)readline("Enter the main script filename that will be in the npc file you generate: ");
$counter = 1;
$lua_command = "dofile(GetScriptPath()..\"$main_spawn_script.lua\")";

$main_spawn_template = 'State
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

};';

$lua_file = fopen($main_spawn_script.'.lua','w+');
$theFile = fwrite($lua_file,$main_spawn_template);

echo "The main script file $lua_file is created";

for($counter; $counter <= $npc_count;$counter++){
  
  $file = fopen($npc_name.$counter.'.lua','w+');
  $lua_file = fwrite($file,$lua_command);
  
  echo "The npc lua file $file is created".PHP_EOL;
  
}
