extends Node2D

var enemy_array = []
var built = false
var enemy

func _ready():
	if built:
		set_turret_range()

func _physics_process(delta):
	if built and enemy_array.size() != 0:
		select_enemy()
		turn()
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
	
func set_turret_range():
	var turret_range = GameData.tower_data[self.get_name()]["range"]
	self.get_node("Range/CollisionShape2D").get_shape().radius = turret_range * 0.5


func _on_Range_body_entered(body):
	enemy_array.append(body.get_parent())


func _on_Range_body_exited(body):
	enemy_array.erase(body.get_parent())
