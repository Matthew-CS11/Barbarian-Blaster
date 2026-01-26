extends Node3D

var projectile = preload("res://Turret/ball.tscn")
var enemy_path : Path3D
var target : Node3D
@export var turret_range := 10.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target != null:
		look_at(target.global_position, Vector3.UP, true)


func find_best_target() -> Enemy:
	var best_target = null
	var best_progress = 0
	
	for enemy in enemy_path.get_children():
		if enemy is Enemy:
			if enemy.progress > best_progress:
				var distance = global_position.distance_to(enemy.global_position)
				if distance <= turret_range:
					best_target = enemy
					best_progress = enemy.progress
	return best_target
		

func _on_timer_timeout() -> void:
	if target != null:
		var ball = projectile.instantiate()
		add_child(ball)
		ball.global_position = global_position
		ball.direction = global_transform.basis.z
		animation_player.play("fire")
