extends Node2D

@export var blade_scene : PackedScene

@onready var spawn_position = get_parent().get_node("SpawnPositionBlade")
@onready var animation = $AnimationPlayer

# TODO: agregar cooldown

func _ready():
	spawn_blade()

func spawn_blade():
	animation.play("appear")
	
	var blade = blade_scene.instantiate()
	blade.global_position = spawn_position.position
	add_child(blade)

func _on_hud_2_redo_blade():
	animation.play("redo")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "redo":
		if get_child_count() != 0 and GLOBAL.blades_left >= 0:
			var remove_node = get_child(1)
			remove_node.queue_free()
			#for i in get_child_count():
				#var remove_node = get_child(i)
				#remove_node.queue_free()
			spawn_blade()
	if anim_name == "done":
		if get_child_count() != 0 and GLOBAL.blades_left >= 0:
			var remove_node = get_child(1)
			remove_node.queue_free()
			spawn_blade()

func _on_hud_2_done_blade():
	animation.play("done")
