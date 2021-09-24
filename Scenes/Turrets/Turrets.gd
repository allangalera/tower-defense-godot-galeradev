extends Node2D

var enemy_array = []
var built = false
var enemy
var type
var category
var ready = true

func _ready():
	if built:
		set_turret_range()

func _physics_process(delta):
	if built and enemy_array.size() != 0:
		select_enemy()
		if not get_node("AnimationPlayer").is_playing():
			turn()
		if ready:
			fire()
	else:
		enemy = null
	
func turn():
	get_node("Turret").look_at(enemy.position)
	
func select_enemy():
	var enemy_progress_array = []
	for enemy in enemy_array:
		enemy_progress_array.append(enemy.offset)
	var max_offset = enemy_progress_array.max()
	var enemy_index = enemy_progress_array.find(max_offset)
	enemy = enemy_array[enemy_index]

func fire():
	ready = false
	if category == "Projectile":
		fire_gun()
	elif category == "Missile":
		fire_missile()
	enemy.on_hit(GameData.tower_data[type]["damage"])
	yield(get_tree().create_timer(GameData.tower_data[type]["rof"]), "timeout")
	ready = true
	
func fire_gun():
	get_node("AnimationPlayer").play("Fire")

func fire_missile():
	pass
	
func set_turret_range():
	var turret_range = GameData.tower_data[type]["range"]
	self.get_node("Range/CollisionShape2D").get_shape().radius = turret_range * 0.5


func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())


func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
