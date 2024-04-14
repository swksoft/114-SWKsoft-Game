extends Sprite2D

signal finish

@export var icon_name: String

@onready var icon = $Icon

var neutral = preload("res://assets/sprites/icon/icon_neutral.png")
var anger = preload("res://assets/sprites/icon/ico_anger.png")
var done = preload("res://assets/sprites/icon/ico_done.png")
var happy = preload("res://assets/sprites/icon/ico_happy.png")
var redo = preload("res://assets/sprites/icon/ico_redo.png")
var sad = preload("res://assets/sprites/icon/ico_sad.png")
var sword = preload("res://assets/sprites/icon/ico_sword.png")
var wee = preload("res://assets/sprites/icon/ico_wee.png")

func _ready():
	icon.texture = icon_name

