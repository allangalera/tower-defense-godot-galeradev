extends Node2D

signal game_finished(result)

var map_node
var base_health = 100
var build_mode = false
var build_valid = false
var build_location
var build_type
var build_tile
var current_wave = 0
var wave_in_motion = false
var enemies_in_wave

func _ready():
	map_node = get_node("Map1")
	for i in get_tree().get_nodes_in_group("build_buttons"):
		i.connect("pressed", self, "initiate_build_mode", [i.get_name()])
	
func _process(delta):
	if build_mode:
		update_tower_preview()
	
func _unhandled_input(event):
	if event.is_action_released("ui_cancel") and build_mode == true:
		cancel_build_mode()
	if event.is_action_released("ui_accept") and build_mode == true:
		verify_and_build()
#		cancel_build_mode()
		
##
## Wave Functions
##
func start_next_wave():
	var wave_data = retrieve_wave_data()
	wave_in_motion = true
	yield(get_tree().create_timer(0.2), "timeout")
	spawn_enemies(wave_data)
	
func retrieve_wave_data():
	var wave_data = [
		["BlueTank", 2.0],
		["BlueTank", 1.0],
		["BlueTank", 1.0],
		["BlueTank", 1.0],
		["BlueTank", 1.0],
	]
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data
	
func spawn_enemies(wave_data):
	for enemy in wave_data:
		var new_enemy = load("res://Scenes/Enemies/" + enemy[0] + ".tscn").instance()
		new_enemy.connect("base_damage", self, "on_base_damage")
		new_enemy.connect("last_enemy", self, "on_last_enemy")
		map_node.get_node("Path").add_child(new_enemy, true)
		yield(get_tree().create_timer(enemy[1]), "timeout")

##
## Building Functions
##
func initiate_build_mode(tower_type):
	if build_mode:
		cancel_build_mode()
	build_type = tower_type
	build_mode = true
	get_node("UI").set_tower_preview(build_type, get_global_mouse_position())
	
func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tile = map_node.get_node("TowerExclusion").world_to_map(mouse_position)
	var tile_position = map_node.get_node("TowerExclusion").map_to_world(current_tile)
	
	if map_node.get_node("TowerExclusion").get_cellv(current_tile) == -1:
		get_node("UI").update_tower_preview(tile_position, "ad54ff3c")
		build_valid = true
		build_location = tile_position
		build_tile = current_tile
	else:
		get_node("UI").update_tower_preview(tile_position, "adff4545")
		build_valid = false
	
func cancel_build_mode():
	build_mode = false
	build_valid = false
	get_node("UI/TowerPreview").free()
	
func verify_and_build():
	if build_valid:
		var new_tower = load("res://Scenes/Turrets/" + build_type + ".tscn").instance()
		new_tower.position = build_location
		new_tower.built = true
		new_tower.type = build_type
		new_tower.category = GameData.tower_data[build_type]["category"]
		map_node.get_node("Turrets").add_child(new_tower, true)
		map_node.get_node("TowerExclusion").set_cellv(build_tile, 5)

func on_base_damage(damage):
	base_health -= damage
	if base_health <= 0:
		emit_signal("game_finished", false)
	else:
		get_node("UI").update_health_bar(base_health)
		
func on_last_enemy():
	wave_in_motion = false
	get_node("UI").finished_wave()
