extends Control

var score

func _ready():
	if (score.result):
		get_node("MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/SuccessOrFail").modulate = "#00ff00"
		get_node("MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/SuccessOrFail").text = "SUCCESS"
	else:
		get_node("MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/SuccessOrFail").modulate = "#ff0000"
		get_node("MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/SuccessOrFail").text = "FAIL"
	
	get_node("MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/Waves").text = 'waves: %d/%d' % [score.current_wave, score.number_of_waves]
	get_node("MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/Health").text = 'health: %d/%d' % [score.health_remain, score.health_init]
	print(score)
