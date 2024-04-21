extends Area2D

@export var minimum_force_break = 15
@export var crack_scene : PackedScene

@onready var mirror_health: int = 300
@onready var canvas_layer = $CanvasLayer
@onready var timer = $Timer
@onready var anim = $AnimationPlayer
@onready var animated_sprite_2d = $AnimatedSprite2D

# TODO: LAS COLISIONES ANDAN RARAS (g)

func _ready():
	animated_sprite_2d.frame = 0

func check_health():
	if mirror_health < 250 and mirror_health > 200:
		animated_sprite_2d.frame = 1
	elif mirror_health < 199 and mirror_health > 75:
		animated_sprite_2d.frame = 2
	elif mirror_health < 74:
		animated_sprite_2d.frame = 3
		
	
	if mirror_health <= 0:
		timer.start()
		anim.play("appear")

func crack(force):
	var crack_mirror = crack_scene.instantiate()
	crack_mirror.global_position = get_global_mouse_position()
	
	if force >= minimum_force_break:
		mirror_health -= force
		#print("salud espejo: ", mirror_health)
		add_child(crack_mirror)
		check_health()
		

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
