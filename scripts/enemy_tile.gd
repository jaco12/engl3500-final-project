extends Tile

#----------CONSTANTS AND VARIABLES----------#


#----------FUNCTIONS----------#
func _ready():
	default_texture = load("res://assets/enemy.png")
	hover_texture = load("res://assets/enemy_red.png")
	tile_type = "enemy"
	super._ready()
