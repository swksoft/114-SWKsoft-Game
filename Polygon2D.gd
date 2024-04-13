extends Polygon2D

@export var polygon_hitbox : CollisionPolygon2D
@export var points_between: int = 64
var points_amount_in_each_side: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	points_amount_in_each_side = polygon[1].x / points_between
	var x_points : Array = []
	var y_points : Array = []
	for i in range(points_between, polygon[1].x, points_between):
		x_points.push_back(Vector2(i, polygon[1].y))
		y_points.push_front(Vector2(i, polygon[4].y))
		
	##sindrome de down
	x_points.push_front(polygon[0])
	x_points.push_back(polygon[1])
	x_points.push_back(polygon[2])
	x_points.push_back(polygon[3])
	y_points.push_back(polygon[4])
	x_points.append_array(y_points)
	##sindrome de down
	polygon = x_points
	polygon_hitbox = CollisionPolygon2D.new()
	reset_hitbox()
	get_parent().call_deferred("add_child", polygon_hitbox)

func reset_hitbox():
	polygon_hitbox.polygon = polygon
	polygon_hitbox.position = position

func _on_static_body_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				var collision_shape = polygon_hitbox
				var local_mouse_pos = polygon_hitbox.to_local(event.position)
				var closest_point : Vector2
				var closest_point_index : int
				var closest_distance : float
				for i in range(collision_shape.polygon.size()):
					var distance = local_mouse_pos.distance_squared_to(collision_shape.polygon[i])
					if distance < closest_distance || i == 0:
						closest_distance = distance
						closest_point = collision_shape.polygon[i]
						closest_point_index = i
						
				if closest_point_index < polygon.size()/2-1:						
					polygon[closest_point_index].y += 20
					polygon[collision_shape.polygon.size()-closest_point_index-1].y += 20
				else:
					polygon[closest_point_index].y -= 20
					polygon[collision_shape.polygon.size()-closest_point_index-1].y -= 20
				reset_hitbox()
