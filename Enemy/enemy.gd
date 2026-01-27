extends PathFollow3D
class_name Enemy

## The speed in m/s the enemy will move
@export var speed :float = 10.0
@onready var enemy: PathFollow3D = $"."
@onready var base : Base = get_tree().get_first_node_in_group("base")
@export var max_health := 50
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var money := 25
@onready var bank = get_tree().get_first_node_in_group("bank")

var health:int :
	set(new_health):
		if health > new_health:
			animation_player.play("take_damage")	
		health = new_health
		if health < 1:
			bank.gold += money
			queue_free()
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * speed
	if enemy.progress_ratio == 1.0:
		base.take_damage()
		enemy.queue_free()
