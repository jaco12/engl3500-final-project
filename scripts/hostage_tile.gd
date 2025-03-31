extends Sprite2D

#----------CONSTANTS AND VARIABLES----------#


#----------FUNCTIONS----------#
func _ready():
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
	texture = load("res://assets/hostage_red.png")

func _on_mouse_exited():
	texture = load("res://assets/hostage.png")
