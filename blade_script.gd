extends Area2D

@export var polygon_hitbox : CollisionPolygon2D
@export var points_between: int = 64

var points_amount_in_each_side: int
var polygon_hbox
var ready_blade : bool = false

@onready var polygon_2d = $Polygon2D

func _ready() -> void:
	randomize()
	
	points_amount_in_each_side = polygon_2d.polygon[1].x / points_between
	var x_points : Array = []
	var y_points : Array = []
	for i in range(points_between, polygon_2d.polygon[1].x, points_between):
		x_points.push_back(Vector2(i, polygon_2d.polygon[1].y))
		y_points.push_front(Vector2(i, polygon_2d.polygon[4].y))
		
	##sindrome de down
	var vertices = polygon_2d.get_polygon()
	
	x_points.push_front(polygon_2d.polygon[0])
	x_points.push_back(polygon_2d.polygon[1])
	x_points.push_back(polygon_2d.polygon[2])
	x_points.push_back(polygon_2d.polygon[3])
	y_points.push_back(polygon_2d.polygon[4])
	x_points.append_array(y_points)
	##sindrome de down
	polygon_2d.polygon = x_points
	polygon_hitbox = CollisionPolygon2D.new()
	polygon_hbox = polygon_hitbox
	
	# RANDOM TEXTURE
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	
	if !ready_blade:
		polygon_2d.texture.noise = noise
		polygon_2d.self_modulate = "d76221"
	else:
		pass
	
	add_child(polygon_hbox)
	reset_hitbox()

func reset_hitbox():
	polygon_hbox.set_deferred("polygon", polygon_2d.polygon)
	polygon_hbox.set_deferred("position", polygon_2d.position)
	#polygon_hbox.polygon = polygon_2d.polygon
	#polygon_hbox.position = polygon_2d.position

func deform(force):
	#var force = area.get_parent().force
	var collision_shape = polygon_hitbox
	var local_mouse_pos = collision_shape.to_local(get_tree().get_first_node_in_group("cursor").get_cursor_position())
	var closest_point : Vector2
	var closest_point_index : int
	var closest_distance : float
	for i in range(collision_shape.polygon.size()):
		var distance = local_mouse_pos.distance_squared_to(collision_shape.polygon[i])
		if distance < closest_distance || i == 0:
			closest_distance = distance
			closest_point = collision_shape.polygon[i]
			closest_point_index = i
			
	if closest_point_index == polygon_2d.polygon.size()/2:
		if local_mouse_pos.y > polygon_2d.polygon[closest_point_index].y: polygon_2d.polygon[closest_point_index].y -= force
		else: polygon_2d.polygon[closest_point_index].y += force
	elif closest_point_index < polygon_2d.polygon.size()/2:
		polygon_2d.polygon[closest_point_index].y += force
		polygon_2d.polygon[collision_shape.polygon.size()-closest_point_index-1].y += force
	else:
		polygon_2d.polygon[closest_point_index].y -= force
		polygon_2d.polygon[collision_shape.polygon.size()-closest_point_index-1].y -= force
	reset_hitbox()
