extends Sprite2D

class_name Tile

#----------CONSTANTS AND VARIABLES----------#
var default_texture: Texture2D
var hover_texture: Texture2D

#----------FUNCTIONS----------#
func _ready():
	texture = default_texture
	
	# Enable mouse detection
	set_process_input(true)

	# Connect signals programmatically
	var area = Area2D.new()
	var collision = CollisionShape2D.new()
	var shape = RectangleShape2D.new()

	# Set shape size based on sprite
	shape.size = texture.get_size()
	collision.shape = shape

	# Add nodes to the sprite
	add_child(area)
	area.add_child(collision)
	
	# Connect signals
	area.mouse_entered.connect(_on_mouse_entered)
	area.mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered():
	texture = hover_texture

func _on_mouse_exited():
	texture = default_texture
	
