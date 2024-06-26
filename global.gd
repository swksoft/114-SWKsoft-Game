extends Node

signal npc_left

const POINTS_DEFAULT = 500

var actual_points: int = 0
var points: int = 0
var blades_left: int = 8

var player_blade #: PackedVector2Array
var npc_blade #: PackedVector2Array

func _process(delta):
	print("PUNTOS ACTUALES = ", actual_points)

func normalize_polygon(polygon: Array, num_vertices: int) -> Array:
	var normalized_polygon = []
	var step = float(polygon.size() - 1) / float(num_vertices - 1)

	for i in range(num_vertices):
		var index = int(i * step)
		normalized_polygon.append(polygon[index])
	
	return normalized_polygon

func calculate_polygon_centroid(polygon: Array) -> Vector2:
	var centroid = Vector2()
	
	for point in polygon:
		centroid += point

	centroid /= polygon.size()
	
	return centroid

func compare_polygons(pol1, pol2):
	# NORMALIZAR POLIGONOS
	var num_vertices = max(pol1.size(), pol2.size())
	var normalized_polygon1 = normalize_polygon(pol1, num_vertices)
	var normalized_polygon2 = normalize_polygon(pol2, num_vertices)
	
	# FUCKING CENTROIDES
	var centroid1 = calculate_polygon_centroid(normalized_polygon1)
	var centroid2 = calculate_polygon_centroid(normalized_polygon2)
	
	var distance = centroid1.distance_to(centroid2)
	return distance
