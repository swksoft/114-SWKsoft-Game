extends Sprite2D

signal finish

@export var icon_name: String
@export var blade_scene : PackedScene

var blade_data_npc

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

@onready var icon = $Icon

var neutral = preload("res://assets/sprites/icon/icon_neutral.png")
var anger = preload("res://assets/sprites/icon/ico_anger.png")
var happy = preload("res://assets/sprites/icon/ico_happy.png")
var sad = preload("res://assets/sprites/icon/ico_sad.png")
var sword = preload("res://assets/sprites/icon/ico_sword.png")
var wee = preload("res://assets/sprites/icon/ico_wee.png")

func _ready():
	randomize()
	
	match icon_name:
		"neutral":
			icon.texture = neutral
		"angry":
			icon.texture = anger
		"happy":
			icon.texture = happy
		"sad":
			icon.texture = sad
		"wee":
			icon.texture = wee
		"sword":
			icon.texture = sword

func create_blade():
	var blade = blade_scene.instantiate()
	
	blade.scale /= 3
	add_child(blade)
	
	var random_coordinates = poly_patterns.pick_random()
	
	blade.randomize_sword(random_coordinates)
	
	GLOBAL.npc_blade = random_coordinates
	print_debug(GLOBAL.npc_blade)
	
	#blade_data_npc = blade.polygon_2d.polygon
	
	#var total_polygons = blade.polygon_2d.polygon.size()
	
	#for i in total_polygons:
	#	blade.polygon_2d.polygon[i] += Vector2(randi_range(-5,5), randi_range(-5,5))

