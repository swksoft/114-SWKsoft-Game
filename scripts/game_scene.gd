extends Node2D

# TODO: Preparar sistema de spawn

@export var can_play: bool = true
@export var npc_scene: PackedScene 

@onready var characters = $Characters

# 1) Comprobar que no haya nadie en pantalla
# 2) Spawnear cliente
# 3) Repetir

func _ready():
	pass

func check_nobody():
	# Devuelve 'true' si no hay nadie
	var characters_children = characters.get_children()
	print(characters_children.size())
	return characters_children.size() == 0

func spawn():
	var npc = npc_scene.instantiate()
	get_node("Characters").add_child(npc)

func _process(delta):
	if !can_play:
		return
	
	print(check_nobody())
	if check_nobody():
		spawn()
