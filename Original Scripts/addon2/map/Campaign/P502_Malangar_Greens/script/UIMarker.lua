---------------------------------
-------------P502----------------
---------------------------------
local MinimapMarker = 1
local buttonsize = 43

State
{
	StateName = "INIT",
	-- Erster Marker Log
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P502_Marker", Value = 1},
			TutorialTaskTextIsOnScreen {Take = 1},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 180, Top = 30, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			--TutorialUIPointerShow {Left = 774, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_down"}, --minimap
			MapValueSet	{Name = "mv_P502_MarkerShown", Value = 1},
		}
	},
	
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 1},
			MapValueIsEqual	{Name = "mv_P502_MarkerShown", Value = 1},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P502_Marker", Value = 2},
			TutorialUIPointerHide {},
		}
	},
	-- Sechster Marker Stufenaufstiegsplus
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P502_Marker", Value = 2},
			TutorialTaskTextIsOnScreen {Take = 3},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 180, Top = 30, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P502_MarkerShown", Value = 2},
		}
	},
	
	-- Early Out, wenn der Spieler den Text überspringt
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 3},
			MapValueIsEqual	{Name = "mv_P502_MarkerShown", Value = 2},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P502_Marker", Value = 3},
			TutorialUIPointerHide {},
		}
	},
}
