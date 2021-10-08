extends PathFollow2D

signal base_damage(damage)
signal last_enemy()
signal im_ded(enemy)

onready var enemy_data = get_enemy_data()
var current_health

onready var hp_bar = get_node("HPBar")
onready var impact_area = get_node("Impact")
var projectile_impact = preload("res://Scenes/Support/ProjectileImpact.tscn")

func _ready():
	current_health = enemy_data.health
	hp_bar.max_value = enemy_data.health
	hp_bar.value = enemy_data.health
	hp_bar.set_as_toplevel(true)
	
func get_enemy_data():
	var tower_name = filename.get_file().trim_suffix('.' + filename.get_extension())
	return GameData.enemies[tower_name]

func _physics_process(delta):
	if  unit_offset == 1.0:
		emit_signal("base_damage", enemy_data.base_damage)
		on_unload()
	move(delta)
	
func move(delta):
	set_offset(get_offset() + enemy_data.speed * delta)
	hp_bar.set_position(position - Vector2(30, 40))
	
func on_hit(damage):
	impact()
	current_health -= damage
	hp_bar.value = current_health
	if (!hp_bar.visible && current_health < enemy_data.health):
		hp_bar.visible = true
	if current_health <= 0:
		on_destroy()
		
func impact():
	randomize()
	var x_pos = randi() % 31
	randomize()
	var y_pos = randi() % 31
	var impact_position = Vector2(x_pos, y_pos)
	var new_impact = projectile_impact.instance()
	new_impact.position = impact_position
	impact_area.add_child(new_impact)
	
func on_destroy():
	get_node("KinematicBody2D").queue_free()
	yield(get_tree().create_timer(0.2), "timeout")
	emit_signal("im_ded", enemy_data)
	on_unload()
	
func on_unload():
	if get_parent().get_children().size() == 1:
		emit_signal("last_enemy")
	self.queue_free()
