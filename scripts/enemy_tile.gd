extends Tile

#----------CONSTANTS AND VARIABLES----------#

#----------FUNCTIONS----------#
func _ready():
	default_texture = load("res://assets/enemy.png")
	hover_texture = load("res://assets/enemy_red.png")
	texture = default_texture
	super._ready()
	


func _on_mouse_entered():
	super._on_mouse_entered()

func _on_mouse_exited():
	super._on_mouse_exited()
