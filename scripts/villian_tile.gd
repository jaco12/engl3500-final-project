extends Tile

#----------CONSTANTS AND VARIABLES----------#


#----------FUNCTIONS----------#
func _ready():
	default_texture = load("res://assets/villian.png")
	hover_texture = load("res://assets/villian_red.png")
	tile_type = "villian"
	super._ready()
