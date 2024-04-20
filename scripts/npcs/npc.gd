class_name NPC extends Sprite2D

@export var globe_scene: PackedScene
@export var difficulty: int = 0
@export_range(0,1) var sex: int = 0

var interaction_ready = false

var CHAR_19308 = load("res://assets/sprites/characters/char_19308.png")
var CHAR_AMALGAMA_4 = load("res://assets/sprites/characters/char_amalgama4.png")
var CHAR_ANIMA_10 = load("res://assets/sprites/characters/char_anima10.png")
var CHAR_COCOBOLO_28 = load("res://assets/sprites/characters/char_cocobolo28.png")
var CHAR_CUCK_39 = load("res://assets/sprites/characters/char_cuck39.png")
var CHAR_CULTIST_5 = load("res://assets/sprites/characters/char_cultist5.png")
var CHAR_D_632 = load("res://assets/sprites/characters/char_d632.png")
var CHAR_DESTRUCTORA_25 = load("res://assets/sprites/characters/char_destructora25.png")
var CHAR_DISASTER_13 = load("res://assets/sprites/characters/char_disaster13.png")
var CHAR_GIANTMOUTH_20 = load("res://assets/sprites/characters/char_giantmouth20.png")
var CHAR_GLUGLO_6 = load("res://assets/sprites/characters/char_gluglo6.png")
var CHAR_GODOTSIMP_33 = load("res://assets/sprites/characters/char_godotsimp33.png")
var CHAR_GOMEZ_7 = load("res://assets/sprites/characters/char_gomez7.png")
var CHAR_KIKI_34 = load("res://assets/sprites/characters/char_kiki34.png")
var CHAR_LOSER_1 = load("res://assets/sprites/characters/char_loser1.png")
var CHAR_LOSER_240 = load("res://assets/sprites/characters/char_loser240.png")
var CHAR_MEDUSA_2 = load("res://assets/sprites/characters/char_medusa2.png")
var CHAR_MINERVA_11 = load("res://assets/sprites/characters/char_minerva11.png")
var CHAR_MORTIS_15 = load("res://assets/sprites/characters/char_mortis15.png")
var CHAR_MYSTERIOUS_9 = load("res://assets/sprites/characters/char_mysterious9.png")
var CHAR_NAKEDMAN_24 = load("res://assets/sprites/characters/char_nakedman24.png")
var CHAR_NECRONOMICON_22 = load("res://assets/sprites/characters/char_necronomicon22.png")
var CHAR_NINJA_30 = load("res://assets/sprites/characters/char_ninja30.png")
var CHAR_POLYMORPHIUS_17 = load("res://assets/sprites/characters/char_polymorphius17.png")
var CHAR_ROBOTBOY_27 = load("res://assets/sprites/characters/char_robotboy27.png")
var CHAR_SENIGATO_26 = load("res://assets/sprites/characters/char_senigato26.png")
var CHAR_SHITTO_21 = load("res://assets/sprites/characters/char_shitto21.png")
var CHAR_SHOTGUN_16 = load("res://assets/sprites/characters/char_shotgun16.png")
var CHAR_SNAKE_36 = load("res://assets/sprites/characters/char_snake36.png")
var CHAR_SPACESEX_14 = load("res://assets/sprites/characters/char_spacesex14.png")
var CHAR_SPARTAN_38 = load("res://assets/sprites/characters/char_spartan38.png")
var CHAR_S_THING_31 = load("res://assets/sprites/characters/char_s_thing31.png")
var CHAR_TALKINGSWORD_19 = load("res://assets/sprites/characters/char_talkingsword19.png")
var CHAR_VINO_12 = load("res://assets/sprites/characters/char_vino12.png")
var CHAR_WORM_3 = load("res://assets/sprites/characters/char_worm3.png")

@onready var time_bar = $GridContainer/TimeBar
@onready var name_label = $GridContainer/NameLabel
@onready var time_left = $TimeLeft
@onready var anim = $AnimationPlayer

var sprites_monster = [CHAR_WORM_3, CHAR_TALKINGSWORD_19, CHAR_S_THING_31, CHAR_SNAKE_36, CHAR_SHOTGUN_16, CHAR_SHITTO_21, CHAR_NINJA_30, CHAR_NECRONOMICON_22, CHAR_MORTIS_15, CHAR_MEDUSA_2, CHAR_GOMEZ_7, CHAR_GLUGLO_6, CHAR_GIANTMOUTH_20, CHAR_D_632, CHAR_CULTIST_5, CHAR_COCOBOLO_28, CHAR_AMALGAMA_4, CHAR_19308]
var sprites_man = [CHAR_VINO_12, CHAR_SPARTAN_38, CHAR_SPACESEX_14, CHAR_SENIGATO_26, CHAR_ROBOTBOY_27, CHAR_POLYMORPHIUS_17, CHAR_NAKEDMAN_24, CHAR_MYSTERIOUS_9, CHAR_LOSER_240, CHAR_LOSER_1, CHAR_GODOTSIMP_33, CHAR_DISASTER_13, CHAR_CUCK_39] + sprites_monster
var sprites_woman = [CHAR_MINERVA_11, CHAR_KIKI_34, CHAR_DESTRUCTORA_25, CHAR_ANIMA_10] + sprites_monster

func _ready():
	var globe = globe_scene.instantiate()
	var max_time = time_left.wait_time
	# TODO: Determinar dificultad
	
	time_bar.max_value = max_time
	time_bar.value = max_time
	anim.play("come_in")
	
	globe.global_position = position - Vector2(130,35)
	globe.create_blade()
	
	add_child(globe)

func check_sword():
	# TODO: Do math and show emotion according to the quality (very happy - sad)
	pass

func go_out():
	GLOBAL.points -= 100 # TODO: Bajar una cantidad considerable de puntos, 100 es ejemplo
	
	var globe = globe_scene.instantiate()
	
	globe.global_position = position - Vector2(130,35)
	globe.icon_name = "angry"
	
	anim.play("come_out")
	
	add_child(globe)

func _process(_delta):
	time_bar.value = time_left.time_left

func _on_time_left_timeout():
	go_out()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "come_in":
		# TODO: (G) Si no está activada esta variable entonces no se pueden pulsar botones (no creashea pero se presentan resultados antes de tiempo) 
		interaction_ready = true
		time_left.start()
	elif anim_name == "come_out":
		queue_free()

func _on_name_label_sex_npc(num):
	if num == 0:
		texture = sprites_man.pick_random()
	elif num == 1:
		texture = sprites_woman.pick_random()
