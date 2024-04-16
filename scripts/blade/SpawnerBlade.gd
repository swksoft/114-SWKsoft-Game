extends Node2D

@export var blade_scene : PackedScene

@onready var spawn_position = get_parent().get_node("SpawnPositionBlade")

func _ready():
	spawn_blade()

func spawn_blade():
	var blade = blade_scene.instantiate()
	blade.global_position = spawn_position.position
	add_child(blade)
