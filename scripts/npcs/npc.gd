class_name NPC extends Sprite2D

@export var globe_scene: PackedScene
@export var difficulty: int = 0

@onready var time_bar = $GridContainer/TimeBar
@onready var name_label = $GridContainer/NameLabel
@onready var time_left = $TimeLeft
@onready var anim = $AnimationPlayer

func _ready():
	# TODO: Prepara nombre random
	# TODO: Prepara espada random
	# TODO: Prepara timer
	var max_time = time_left.wait_time
	time_bar.max_value = max_time
	time_bar.value = max_time
	anim.play("come_in")
	
	var globe = globe_scene.instantiate()
	globe.global_position = global_position - Vector2(-100,0)
	globe.icon_name = "anger"


func get_sword():
	# TODO: Do math and show emotion according to the quality (very happy - sad)
	pass

func go_out():
	var globe = globe_scene.instantiate()
	globe.global_position = global_position - Vector2(-100,0)
	
	globe.icon_name = "anger"
	
	anim.play("come_out")
	
	#add_child(globe)

func _process(delta):
	time_bar.value = time_left.time_left

func _on_time_left_timeout():
	go_out()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "come_in":
		time_left.start()
	elif anim_name == "come_out":
		queue_free()
