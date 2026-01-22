extends Node3D
class_name TurretManager

@export var turret : PackedScene
@export var enemy_path : Path3D

func build_turret(pos:Vector3) -> void:
	var tur = turret.instantiate()
	add_child(tur)
	tur.global_position = pos
	tur.enemy_path = enemy_path
