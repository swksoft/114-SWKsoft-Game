extends Sprite2D

signal finish

@export var icon : Texture2D = null

func _ready():
	show_sword(icon)
	
func show_sword(icon):
	pass

func show_emotion(icon):
	pass

func _on_finish():
	# TODO: show emotion according to calculae
	pass
