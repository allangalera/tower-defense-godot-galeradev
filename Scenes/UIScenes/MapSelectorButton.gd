extends TextureButton

signal load_map()

var map;
var label;

func _ready():
	get_node("Label").text = label;

func _on_MapSelectorButton_pressed():
	emit_signal("load_map", map)
