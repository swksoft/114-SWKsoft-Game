extends Node2D

@onready var his_blade = $HisBlade
@onready var your_blade = $YourBlade

var polygon1 : Array = [Vector2(-48, -32), Vector2(32, -89.33333), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, -25.33334), Vector2(-48, 32)]
var polygon2 : Array = [Vector2(-48, -32), Vector2(32, -32), Vector2(64, 62.66667), Vector2(109, 0), Vector2(64, 126.6667), Vector2(32, 32), Vector2(-48, 32)]

func _ready():
	$HisBlade/Polygon2D.polygon = polygon1
	$YourBlade/Polygon2D.polygon = polygon2
	
	
	#his_blade.polygon_2d.polygon[3] += Vector2(0,60)
	
	his_blade.reset_hitbox()
	your_blade.reset_hitbox()
	
	#print(evaluate((final_results(point_distance()))))

func randomize_blade():
	var total_polygons = his_blade.polygon_2d.polygon.size()
	
	for i in total_polygons:
		randomize()
		his_blade.polygon_2d.polygon[i] += Vector2(randi_range(-5,5), randi_range(-5,5))
	
	for i in total_polygons:
		your_blade.polygon_2d.polygon[i] += Vector2(randi_range(-5,5), randi_range(-5,5))
		
func point_distance():
	var blade_points = []
	
	for i in his_blade.polygon_2d.polygon.size():
		var res = your_blade.polygon_2d.polygon[i].distance_to(his_blade.polygon_2d.polygon[i])
		blade_points.append(res)
	
	return blade_points

func final_results(distante_points: Array):
	var result = 0
	
	for i in distante_points.size():
		result += distante_points[i]
		
	return result

func evaluate(result):
	var point_multiplier = 2
	
	if result >= 60:
		print("Fail (", result, ")")
		return 0
	else:
		print("Good (", result, ")")
		return point_multiplier - (point_multiplier / result)
	
