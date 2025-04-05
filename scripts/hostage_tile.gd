extends Tile

#----------CONSTANTS AND VARIABLES----------#

#----------FUNCTIONS----------#
func _ready():
	default_texture = load("res://assets/hostage.png")
	hover_texture = load("res://assets/hostage_red.png")
	texture = default_texture
	super._ready()

func _on_mouse_entered():
	super()

func _on_mouse_exited():
	super()
