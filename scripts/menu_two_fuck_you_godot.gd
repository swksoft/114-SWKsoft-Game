extends Node2D

signal open

@export var game_start_scene : PackedScene = preload("res://scenes/game_scene.tscn")

@onready var closed_area = $CanvasLayer/ClosedArea

var cringe = "cringe"
var shop_health = 200

func pound():
	shop_health -= 200
	closed_area.global_position.y -= 50
	if shop_health < 0:
		emit_signal("open")

func _on_closed_area_area_entered(area):
	print("a")
	pound()
	
func _on_open():
	#get_tree().change_scene_to_file("res://scenes/game_scene.tscn")
	get_tree().change_scene_to_packed(game_start_scene)
	#get_tree().call_deferred("change_scene_to_file", "res://scenes/game_scene.tscn")
	
