extends MarginContainer

@export var starting_gold := 150
@onready var label: Label = $Label

var gold :int:
	set(gld):
		gold = max(0, gld)
		label.text = "Gold: "+str(gold)
		
func _ready() -> void:
	gold = starting_gold
