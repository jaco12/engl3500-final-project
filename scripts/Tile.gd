extends Sprite2D

class_name Tile

#----------CONSTANTS AND VARIABLES----------#

signal hovered(tile)
signal exited(tile)

var row := 0
var col := 0

var default_texture: Texture2D
var hover_texture: Texture2D
var tile_type: String

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
	emit_signal("hovered", self)

func _on_mouse_exited():
	emit_signal("exited", self)

func highlight():
	texture = hover_texture

func reset():
	texture = default_texture
