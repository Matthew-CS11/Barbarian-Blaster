extends Node3D
class_name Base

@onready var label_3d: Label3D = $Label3D
@export var max_health := 5

var health:int :
	set(new_health):
		health = new_health
		label_3d.text = str(health) + "/" + str(max_health)
		var red : Color = Color.RED
		var white : Color = Color.WHITE
		
		label_3d.modulate = red.lerp(white, float(health) / float(max_health))
		
		if health <= 0:
			get_tree().reload_current_scene()

func _ready() -> void:
	health = max_health

func take_damage() -> void:
	print("damage taken")
	health -= 1
	#set_health()
	#
#func set_health() -> void:
	#health = max_health
	#health -= 1
	#max_health = health
	#label_3d.text = str(max_health)
