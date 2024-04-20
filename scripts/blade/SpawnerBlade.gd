extends Node2D

@export var blade_scene : PackedScene

@onready var spawn_position = get_parent().get_node("SpawnPositionBlade")

func _ready():
	spawn_blade()

func spawn_blade():
	# TODO: Spawn sword animation
	var blade = blade_scene.instantiate()
	blade.global_position = spawn_position.position
	add_child(blade)

func _on_hud_2_redo_blade():
	# TODO: Throw sword animation
	if get_child_count() != 0 and GLOBAL.blades_left >= 0:
		for i in get_child_count():
			var remove_node = get_child(i)
			remove_node.queue_free()
		spawn_blade()
