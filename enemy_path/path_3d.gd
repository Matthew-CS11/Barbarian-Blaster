extends Path3D

@export var enemy_scene : PackedScene
@export var diff_manager : Node
@onready var timer: Timer = $Timer

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	timer.wait_time = diff_manager.get_spawn_time()
	enemy.max_health = diff_manager.get_enemy_health()

func _on_timer_timeout() -> void:
	spawn_enemy()
