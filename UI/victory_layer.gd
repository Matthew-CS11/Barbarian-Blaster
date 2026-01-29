extends CanvasLayer

@onready var star_2: TextureRect = $ColorRect/CenterContainer/PanelContainer/VBoxContainer/StarContainer/Star2
@onready var star_3: TextureRect = $ColorRect/CenterContainer/PanelContainer/VBoxContainer/StarContainer/Star3
@onready var base := get_tree().get_first_node_in_group("base")
@onready var bank := get_tree().get_first_node_in_group("bank")
@onready var survived_label: Label = %SurvivedLabel
@onready var health_label: Label = %HealthLabel
@onready var money_label: Label = %MoneyLabel

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()

func victory() -> void:
	visible = true
	if base.health == base.max_health:
		star_2.modulate = Color.WHITE
		health_label.visible = true
	if bank.gold >= 500:
		star_3.modulate = Color.WHITE
		money_label.visible = true
