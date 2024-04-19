extends Area2D

@onready var collision = $CollisionShape2D

func crack(force):
	collision.global_position.y += -force

func _process(delta):
	if collision.global_position.y <= -50:
		get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
