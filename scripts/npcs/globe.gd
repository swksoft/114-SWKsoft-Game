extends Sprite2D

signal finish

@export var icon_name: String
@export var blade_scene : PackedScene

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
	blade.ready_blade = true
	blade.scale /= 2
	add_child(blade)
	
	#var total_polygons = blade.polygon_2d.polygon.size()
	
	#for i in total_polygons:
	#	blade.polygon_2d.polygon[i] += Vector2(randi_range(-5,5), randi_range(-5,5))
