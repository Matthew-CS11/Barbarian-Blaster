extends Camera3D

@export var gridmap : GridMap
@export var turret_manager : TurretManager
@export_enum("easy", "medium", "hard") var difficulty : String = "medium"
var tower_dict = {"easy":50, "medium":100, "hard":150}
var tower_cost :int

@onready var ray_cast_3d: RayCast3D = $RayCast3D
@onready var bank = get_tree().get_first_node_in_group("bank")

func _ready() -> void:
	tower_cost = tower_dict[difficulty]

func _process(delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100.0
	
	#update ray instantly
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap and bank.gold >= tower_cost:
			var collision_point = ray_cast_3d.get_collision_point()
			var perfect_cell = gridmap.local_to_map(collision_point)
			if gridmap.get_cell_item(perfect_cell) == 0:
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				if Input.is_action_just_pressed("click"):
					gridmap.set_cell_item(perfect_cell, 1)
					var tile_pos = gridmap.map_to_local(perfect_cell)
					turret_manager.build_turret(tile_pos)
					bank.gold -= tower_cost
			else:
				Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
