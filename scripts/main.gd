extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	init_board(5, 5, 25)
	connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	

func init_board(rows, columns, enemy_gen_percentage):
	var rng = RandomNumberGenerator.new()
	
	for row in range(rows):
		for col in range(columns):
			var x = (col*200) + 100
			var y = (row*200) + 100
			var rand_num = rng.randf_range(0.0, 100.0)
			if rand_num < enemy_gen_percentage:
				init_square("enemy", x, y)
			else:
				init_square("hostage", x, y)
	

func init_square(square_type, x, y) -> void:
	var sprite = Sprite2D.new()
	
	if square_type == "enemy":
		sprite.texture = load("res://assets/enemy.png")
		sprite.set_script(load("res://scripts/enemy_tile.gd"))
	elif square_type == "hostage":
		sprite.texture = load("res://assets/hostage.png")
		sprite.set_script(load("res://scripts/hostage_tile.gd"))
		
	var desired_size = Vector2(200, 200)  # Set the exact size you want
	var texture_size = sprite.texture.get_size()
	sprite.scale = desired_size / texture_size  # Adjust scale to match desired size
	
	sprite.position = Vector2(x, y)
	add_child(sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("space"):
		init_board(5, 5, 25)
