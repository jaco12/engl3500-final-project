extends Tile

#----------CONSTANTS AND VARIABLES----------#


#----------FUNCTIONS----------#
func _ready():
	default_texture = load("res://assets/president.png")
	hover_texture = load("res://assets/president_red.png")
	tile_type = "president"
	super._ready()
