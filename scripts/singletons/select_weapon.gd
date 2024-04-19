extends Area2D

func _process(delta):
	print(get_global_mouse_position())
	print(get_global_mouse_position() >= Vector2(0,1))

func select_weapon():
	pass
