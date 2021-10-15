extends Node

onready var main_menu_scene = preload("res://Scenes/UIScenes/MainMenu.tscn")
onready var game_scene = preload("res://Scenes/MainScenes/GameScene.tscn")
onready var map_score_scene = preload("res://Scenes/UIScenes/MapScore.tscn")
onready var map_selector_scene = preload("res://Scenes/UIScenes/MapSelector.tscn")

func _ready():
	load_main_menu()
	
func load_main_menu():
	var main_menu_scene_instance = main_menu_scene.instance()
	add_child(main_menu_scene_instance)
	get_node("MainMenu/MarginContainer/VBoxContainer/NewGame").connect("pressed", self, "on_new_game_pressed")
	get_node("MainMenu/MarginContainer/VBoxContainer/Quit").connect("pressed", self, "on_quit_pressed")
	
func on_new_game_pressed():
	get_node("MainMenu").queue_free()
	var map_selector_scene_instance = map_selector_scene.instance()
	map_selector_scene_instance.connect("go_back", self, "go_back_from_map_selector")
	map_selector_scene_instance.connect("on_map_selected", self, "on_map_selected")
	add_child(map_selector_scene_instance)
	
func on_map_selected(map):
	get_node("MapSelector").queue_free()
	var game_scene_instance = game_scene.instance()
	game_scene_instance.connect("game_finished", self, "show_results")
	game_scene_instance.current_map = map
	add_child(game_scene_instance)

func on_quit_pressed():
	get_tree().quit()
	
func show_results(score):
	var map_score_scene_instance = map_score_scene.instance()
	map_score_scene_instance.score = score
	get_node("GameScene").queue_free()
	add_child(map_score_scene_instance)
	get_node("MapScore/MarginContainer/VBoxContainer/Ok").connect("pressed", self, "go_to_menu")
	
func go_to_menu():
	get_node("MapScore").queue_free()
	load_main_menu()

func go_back_from_map_selector():
	get_node("MapSelector").queue_free()
	load_main_menu()
	
	
func unload_game(result):
	get_node("GameScene").queue_free()
	load_main_menu()

