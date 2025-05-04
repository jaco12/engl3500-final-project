extends Node

#----------CONSTANTS AND VARIABLES----------#

var enemies_killed := 0
var hostages_killed := 0
var pres_killed := 0
var villians_killed := 0

var affected_tile_types = []

#----------FUNCTIONS----------#

func death_count():
	for type in affected_tile_types:
		if type == "enemy":
			GameStats.enemies_killed += 1
		elif type == "hostage":
			GameStats.hostages_killed += 1
		elif type == "president":
			GameStats.pres_killed += 1
		elif type == "villian":
			GameStats.villians_killed += 1

func reset():
	enemies_killed = 0
	hostages_killed = 0
	pres_killed = 0
	villians_killed = 0
	affected_tile_types = []
