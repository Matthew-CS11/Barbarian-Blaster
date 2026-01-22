extends Node3D

var projectile = preload("res://Turret/ball.tscn")


func _on_timer_timeout() -> void:
	var ball = projectile.instantiate()
	add_child(ball)
	ball.global_position = global_position
