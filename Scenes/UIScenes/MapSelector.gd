extends Control

signal go_back()
signal on_map_selected()

onready var map_selector_button_scene = preload("res://Scenes/UIScenes/MapSelectorButton.tscn")
onready var grid_container_node = get_node("MarginContainer/VBoxContainer/VSplitContainer/GridContainer")

func _ready():
	var index = 1
	for map in GameData.maps:
		var map_selector_button_scene_instance = map_selector_button_scene.instance()
		map_selector_button_scene_instance.map = map
		map_selector_button_scene_instance.label = "%d" % index
		map_selector_button_scene_instance.connect("load_map", self, "emit_on_map_selected")
		grid_container_node.add_child(map_selector_button_scene_instance)
		index += 1
		
func _on_GoBack_pressed():
	emit_signal("go_back")

func emit_on_map_selected(map):
	emit_signal("on_map_selected", map)
