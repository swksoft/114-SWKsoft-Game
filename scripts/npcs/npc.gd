class_name NPC extends Sprite2D

@export var globe_scene: PackedScene
@export var difficulty: int = 0

func _ready():
	# TODO: Prepara nombre random
	# TODO: Prepara espada random
	# TODO: Prepara timer
	pass

func get_sword():
	# TODO: Do math and show emotion according to the quality (very happy - sad)
	pass

func go_out():
	# TODO: show a globe with bad emotion (angry)
	pass

func _on_time_left_timeout():
	go_out()
