extends Path3D

@export var enemy_scene : PackedScene
@export var diff_manager : Node
@onready var timer: Timer = $Timer
@export var victory_layer : CanvasLayer

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	enemy.max_health = diff_manager.get_enemy_health()
	add_child(enemy)
	enemy.tree_exited.connect(enemy_defeated)
	timer.wait_time = diff_manager.get_spawn_time()


func enemy_defeated() -> void:
	if timer.is_stopped():
		for child in get_children():
			if child is Enemy:
				return
		victory_layer.visible = true

func _on_timer_timeout() -> void:
	spawn_enemy()


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	timer.stop()
