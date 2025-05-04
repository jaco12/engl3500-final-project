extends Node2D

#----------CONSTANTS AND VARIABLES----------#

const ROWS = 5
const COLUMNS = 5
const SPRITE_SIZE = 200
const HOSTAGES = 11
const PRESIDENTS = 2
const VILLIANS = 1

var tileboard = []
var affected_tile_types = []
var hovered_tile = null
var hover_update_pending := false
var next_hovered_tile = null

var timer : float = 1.5 # seconds
var time_passed : float = 0.0

#----------FUNCTIONS----------#

# Called when the node enters the scene tree for the first time.
func _ready():
	init_board(ROWS, COLUMNS, HOSTAGES, PRESIDENTS, VILLIANS)

func _process(delta):
	time_passed += delta
	if time_passed >= timer:
		time_passed = 0.0
		init_board(ROWS, COLUMNS, HOSTAGES, PRESIDENTS, VILLIANS)

func init_board(num_rows, num_cols, num_hostages, num_pres, num_villians):
	# clear tileboard
	for row in tileboard:
		for tile in row:
			tile.queue_free()
	tileboard.clear()
	
	# create shuffled tile list
	var total_tiles = num_rows * num_cols
	var num_enemies = total_tiles - num_hostages - num_pres - num_villians
	
	var tile_types = []
	for i in range(num_enemies):
		tile_types.append("enemy")
	for i in range(num_hostages):
		tile_types.append("hostage")
	for i in range(num_pres):
		tile_types.append("president")
	for i in range(num_villians):
		tile_types.append("villian")
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	tile_types.shuffle()
	
	# create tileboard based on shuffled tile list
	var index = 0
	for r in range(num_rows):
		var row = []
		for c in range(num_cols):
			var tile_type = tile_types[index]
			index += 1
			
			# create tile
			var tile = Sprite2D.new()
			if tile_type == "enemy":
				tile.texture = load("res://assets/enemy.png")
				tile.set_script(load("res://scripts/enemy_tile.gd"))
			elif tile_type == "hostage":
				tile.texture = load("res://assets/hostage.png")
				tile.set_script(load("res://scripts/hostage_tile.gd"))
			elif tile_type == "president":
				tile.texture = load("res://assets/president.png")
				tile.set_script(load("res://scripts/president_tile.gd"))
			elif tile_type == "villian":
				tile.texture = load("res://assets/villian.png")
				tile.set_script(load("res://scripts/villian_tile.gd"))
			
			# place tile
			tile.row = r
			tile.col = c
			tile.position = Vector2(c, r) * SPRITE_SIZE
			tile.position += Vector2(SPRITE_SIZE/2, SPRITE_SIZE/2)
			
			# connect signals
			tile.connect("exited", Callable(self, "_on_tile_exited"))
			tile.connect("hovered", Callable(self, "_on_tile_hovered"))
			
			add_child(tile)
			row.append(tile)
		tileboard.append(row)

func _on_tile_hovered(tile):
	next_hovered_tile = tile
	_schedule_hover_update()

func _on_tile_exited(tile):
	if hovered_tile == tile:
		hovered_tile = null
		_schedule_hover_update()

func _schedule_hover_update():
	if not hover_update_pending:
		hover_update_pending = true
		await get_tree().process_frame
		_update_hover_state()
		hover_update_pending = false

func _update_hover_state():
	# Clear all highlights first
	for row in tileboard:
		for tile in row:
			tile.reset()
	
	hovered_tile = next_hovered_tile
	if hovered_tile != null:
		var row = hovered_tile.row
		var col = hovered_tile.col
		var positions := {}
		
		for c in range(COLUMNS):
			positions[Vector2i(row, c)] = true
		for r in range(ROWS):
			positions[Vector2i(r, col)] = true
		
		for p in positions.keys():
			var curr_tile = tileboard[p.x][p.y]
			affected_tile_types.append(curr_tile.tile_type)
			curr_tile.highlight()
	
	GameStats.affected_tile_types = affected_tile_types.duplicate()
	affected_tile_types.clear()

func reset_highlights():
	for r in range(ROWS):
		for c in range(COLUMNS):
			tileboard[r][c].reset()

func _input(event): # change scenes on mouse click
	if event is InputEventMouseButton and event.pressed:
		var click_pos = event.position
		var trigger_rect = Rect2(Vector2(0, 0), Vector2(1000, 1000))  # (top-left, size)

		if trigger_rect.has_point(click_pos):
			get_tree().change_scene_to_file("res://scenes/EndingScreen.tscn")
