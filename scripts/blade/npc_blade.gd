extends Polygon2D

var poly_patterns : Array = [[Vector2(-48,-32), Vector2(32, -89.33333), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, -25.33334), Vector2(-48, 32)],
	[Vector2(-48, -32), Vector2(32, -32), Vector2(64, 62.66667), Vector2(109, 0), Vector2(64, 126.6667), Vector2(32, 32), Vector2(-48, 32)],
	[Vector2(-48, -32), Vector2(32, -154.6636), Vector2(64, -106.6667), Vector2(109, 0), Vector2(64, -42.66667), Vector2(32, -90.6636), Vector2(-48, 32)],
	[Vector2(-48, -118.6645), Vector2(32, -32), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 32), Vector2(-48, -54.6645)],
	[Vector2(-48, -46.6645), Vector2(32, 10.16563), Vector2(64, -78.66666), Vector2(109, 0), Vector2(64, -14.66667), Vector2(32, 74.16563), Vector2(-48, 17.3355)],
	[Vector2(-48, -32), Vector2(32, -32), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 32), Vector2(-48, 32)],
	[Vector2(-48, -32), Vector2(32, -174.6667), Vector2(64, -223.9952), Vector2(109, 0), Vector2(64, -159.9952), Vector2(32, -110.6667), Vector2(-48, 32)],
	[Vector2(-48, -32), Vector2(32, -32), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 32), Vector2(-48, 32)],
	[Vector2(-48, -32), Vector2(32, -32), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 32), Vector2(-48, 32)],
	[Vector2(-48, -32), Vector2(32, -32), Vector2(64, -21.33333), Vector2(109, 0), Vector2(64, 42.66667), Vector2(32, 32), Vector2(-48, 32)],
	[Vector2(-48, -105.3332), Vector2(32, -89.33334), Vector2(64, -37.3336), Vector2(109, 0), Vector2(64, 26.6664), Vector2(32, -25.33333), Vector2(-48, -41.3332)],
	[Vector2(-48, -122.6665), Vector2(32, 20), Vector2(64, 57.33307), Vector2(109, 0), Vector2(64, 121.3331), Vector2(32, 84), Vector2(-48, -58.66653)],
	[Vector2(-48, -6.6673), Vector2(32, -32), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 32), Vector2(-48, 57.3327)],
	[Vector2(-48, -73.33511), Vector2(32, -4), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 60), Vector2(-48, -9.335106)],
	[Vector2(-48, -73.33511), Vector2(32, -50.66667), Vector2(64, -32), Vector2(109, 0), Vector2(64, 32), Vector2(32, 13.33333), Vector2(-48, -9.335106)]]

func _ready():
	pass
	#polygon = poly_patterns.pick_random()

func randomize_sword(coordinates):
	polygon = coordinates
