extends Area2D

var default : Resource = preload("res://assets/sprites/icon/hammer1.png")
var hammer : Resource = preload("res://assets/sprites/icon/hammer2.png")

@onready var texture_hammer = $TextureHammer
@onready var anim = $AnimationPlayer

func _ready():
	change_weapon()
	

func change_weapon():
	if CustomCursor.current == 0:
		texture_hammer.texture = default
		CustomCursor.current = 1
	elif CustomCursor.current == 1:
		texture_hammer.texture = hammer
		CustomCursor.current = 0

func _on_mouse_entered():
	anim.play("go_up")
	texture_hammer.visible = true

func _on_mouse_exited():
	anim.play("go_down")
	#texture_hammer.visible = false

func _on_input_event(viewport, event, shape_idx):
	print("pij")
	if (event is InputEventMouseButton && event.pressed):
		change_weapon()
