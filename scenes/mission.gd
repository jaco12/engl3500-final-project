extends Node

#----------CONSTANTS AND VARIABLES----------#


#----------FUNCTIONS----------#

func _ready():
	$MarginContainer/MissionDebriefLabel.visible = true
	$MarginContainer2/MissionDetailsLabel.visible = false
	$MissionDetailsButton.set_pressed_no_signal(false)
	$MissionDebriefButton.set_pressed_no_signal(true)

func _on_mission_debrief_button_pressed():
	$MarginContainer/MissionDebriefLabel.visible = true
	$MarginContainer2/MissionDetailsLabel.visible = false
	$MissionDetailsButton.set_pressed_no_signal(false)

func _on_mission_details_button_pressed():
	$MarginContainer/MissionDebriefLabel.visible = false
	$MarginContainer2/MissionDetailsLabel.visible = true
	$MissionDebriefButton.set_pressed_no_signal(false)
