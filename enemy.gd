extends PathFollow3D

@export var speed :float= 10.0

func _process(delta: float) -> void:
	progress_ratio += delta* speed
