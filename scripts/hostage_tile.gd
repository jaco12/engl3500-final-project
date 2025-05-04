extends Tile

#----------CONSTANTS AND VARIABLES----------#


#----------FUNCTIONS----------#
func _ready():
	default_texture = load("res://assets/hostage.png")
	hover_texture = load("res://assets/hostage_red.png")
	tile_type = "hostage"
	super._ready()
