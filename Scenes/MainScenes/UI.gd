extends CanvasLayer

onready var hp_bar = get_node("HUD/InfoBar/MC/H/HP")
onready var hp_bar_tween = get_node("HUD/InfoBar/MC/H/HP/Tween")
onready var play_pause_btn = get_node("HUD/GameControls/HBox/PausePlay")
onready var wave_number = get_node("HUD/InfoBar/MC/H/H2/Wave")
onready var money_node = get_node("HUD/InfoBar/MC/H/H/Money")

func update_current_wave(value, max_value):
	wave_number.text = '%d/%d' % [value, max_value]
	
func update_money(value):
	money_node.text = '%d' % value

func set_tower_preview(tower_type, mouse_position):
	var drag_tower = load("res://Scenes/Turrets/" + tower_type + ".tscn").instance()
	drag_tower.set_name("DragTower")
	drag_tower.modulate = Color("ad54ff3c")
	
	var range_texture = Sprite.new()
	range_texture.position = Vector2(32, 32)
	var scaling = GameData.towers[tower_type]["range"] / 600.0
	range_texture.scale = Vector2(scaling, scaling)
	var texture = load("res://Assets/Ui/range_overlay.png")
	range_texture.texture = texture
	range_texture.modulate = Color("ad54ff3c")
	
	var control = Control.new()
	control.add_child(drag_tower, true)
	control.add_child(range_texture, true)
	control.rect_position = mouse_position
	control.set_name("TowerPreview")
	add_child(control, true)
	move_child(get_node("TowerPreview"), 0)

func update_tower_preview(new_position, color):
	get_node("TowerPreview").rect_position = new_position
	if get_node("TowerPreview/DragTower").modulate != Color(color):
		get_node("TowerPreview/DragTower").modulate = Color(color)
		get_node("TowerPreview/Sprite").modulate = Color(color)

##
## Game Control Functions
##
func _on_PausePlay_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
		
	if get_tree().is_paused():
		get_tree().paused = false
	elif not get_parent().wave_in_motion:
		get_parent().start_next_wave()
	else:
		get_tree().paused = true

func _on_SpeedUp_pressed():
	if get_parent().build_mode:
		get_parent().cancel_build_mode()
	if Engine.get_time_scale() == 2.0:
		Engine.set_time_scale(1.0)
	else:
		Engine.set_time_scale(2.0)
		
func update_health_bar(base_health):
	hp_bar_tween.interpolate_property(hp_bar, "value", hp_bar.value, base_health, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	hp_bar_tween.start()
	if base_health >= 60:
		hp_bar.set_tint_progress("48dc81")
	elif base_health <= 60 and base_health >= 25:
		hp_bar.set_tint_progress("DC8047")
	else:
		hp_bar.set_tint_progress("DC4771")

func finished_wave():
	play_pause_btn.set_pressed(false)
