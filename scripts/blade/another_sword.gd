extends Node2D

@onready var pol1 = $Pol1
@onready var pol2 = $Pol2

#var array_pol1 = PackedVector2Array([Vector2(12, 34), Vector2(56, 78)])
@onready var array_pol1 = PackedVector2Array(pol1.polygon)
@onready var array_pol2 = PackedVector2Array(pol2.polygon)

#func _input(event):
	#if event is InputEventMouseButton and event.pressed:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#var global_click_position = event.position
			#var local_click_position = global_transform.affine_inverse()*(global_click_position)
			#var bounding_rect = rect
			#var center = bounding_rect.position + bounding_rect.size / 2
#
			## Calculate the direction of the click relative to the center of the bounding box
			#var direction = (local_click_position - center).normalized()
#
			## Modify the polygon's vertices based on the direction of the click
			#if direction.y < 0:  # Clicked above the center
				#modify_polygon_shape(0.5, 0.5, -0.5, 0.5)
			#else:  # Clicked below the center
				#modify_polygon_shape(-0.5, -0.5, 0.5, -0.5)

func _ready():
	#Geometry2D.clip_polygons((pol1.polygon), (pol2.polygon))
	var result = Geometry2D.clip_polygons((array_pol1), (array_pol2))
	var result2 = Geometry2D.clip_polygons((array_pol2), (array_pol1))
	
	pol1.polygon = result[0]
	pol2.polygon = result2[0]
	
	#new_pol.polygon = pol1.polygon 
	var new_pol = Polygon2D.new()
	new_pol.offset = Vector2(100, 100)
	#new_pol.polygon = PackedVector2Array(result[0])
	new_pol.polygon = pol2.polygon
	#new_pol.polygon = PackedVector2Array([Vector2(0, 0), Vector2(2, 0), Vector2(2, 2), Vector2(0, 2)]) # COORDENADAS POL nuevo
	#new_pol.scale = Vector2(15,15)
	add_child(new_pol)
	print(new_pol.polygon)
	
	print(array_pol1)
