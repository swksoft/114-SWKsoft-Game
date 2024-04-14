extends Node2D

# 1) Comprobar que no haya nadie en pantalla
# 2) Spawnear cliente
# 3) Repetir

@export var can_play: bool = true
@export var npc_scene: PackedScene 

@onready var characters = get_parent().get_node("Characters")

func _ready():
	pass

func check_nobody():
	# Devuelve 'true' si no hay nadie
	var characters_children = characters.get_children()
	return characters_children.size() == 0

func spawn():
	var npc = npc_scene.instantiate()
	get_parent().get_node("Characters").add_child(npc)

func _process(delta):
	if !can_play:
		return
		
	if check_nobody():
		spawn()
