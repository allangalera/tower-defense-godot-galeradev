extends PathFollow2D

signal base_damage(damage)
signal last_enemy()

var speed = 150
var hp = 50
var base_damage = 21

onready var hp_bar = get_node("HPBar")
onready var impact_area = get_node("Impact")
var projectile_impact = preload("res://Scenes/Support/ProjectileImpact.tscn")

func _ready():
	hp_bar.max_value = hp
	hp_bar.value = hp
	hp_bar.set_as_toplevel(true)

func _physics_process(delta):
	if  unit_offset == 1.0:
		emit_signal("base_damage", base_damage)
		on_unload()
	move(delta)
	
func move(delta):
	set_offset(get_offset() + speed * delta)
	hp_bar.set_position(position - Vector2(30, 40))
	
func on_hit(damage):
	impact()
	hp -= damage
	hp_bar.value = hp
	if (!hp_bar.visible && hp < hp_bar.max_value):
		hp_bar.visible = true
	if hp <= 0:
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
	on_unload()
	
func on_unload():
	if get_parent().get_children().size() == 1:
		emit_signal("last_enemy")
	self.queue_free()
