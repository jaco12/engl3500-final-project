extends Node

#----------CONSTANTS AND VARIABLES----------#

#----------FUNCTIONS----------#
func _ready():
	GameStats.death_count()
	var green = Color(0.0,1.0,0.0,1.0)
	
	$Labels/Stats.set("theme_override_colors/font_color",green)
	$Labels/Stats.text = "
		MISSION DEBRIEF: \n\n
		Enemy combatants killed: %d \n
		Civilian hostages killed: %d \n
		High-value hostages (POTUS/FLOTUS) killed: %d \n
		High-value targets killed: %d \n\n
		Was it worth it?
		" % [GameStats.enemies_killed, GameStats.hostages_killed, GameStats.pres_killed, GameStats.villians_killed]
	
	$Buttons/PlayAgain.set("theme_override_colors/font_color",green)


func _on_play_again_pressed():
	GameStats.reset()
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
