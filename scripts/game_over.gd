extends Area2D

@onready var mirror_health: int = 300
@onready var canvas_layer = $CanvasLayer
@onready var timer = $Timer
@onready var anim = $AnimationPlayer

func check_health():
	if mirror_health <= 0:
		timer.start()
		anim.play("appear")

func crack(force):
	mirror_health -= force
	print("salud espejo: ", mirror_health)
	check_health()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
