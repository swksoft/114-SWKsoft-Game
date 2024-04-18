class_name Cursor extends Node2D

# TODO: que al mantener presionado click no se pueda ejecutar el martillazo de nuevo

@export var hw_cursor: Texture2D = null
@export var sf_cursor: Texture2D = null

var time: float = 0.0
var final_time: float = 0.0
var can_pound = true
var force : float

@onready var software_cursor = $SoftwareCursor
@onready var animation_player = $AnimationPlayer
@onready var pound_area = $PoundArea
@onready var cooldown = $Cooldown

func _ready():
	software_cursor.texture = sf_cursor
	software_cursor.position.x = -100
	
	animation_player.play("idle")
	
	Input.set_custom_mouse_cursor(hw_cursor, Input.CURSOR_ARROW)

#func _input(event):
	#if event is InputEventMouseButton:
		#animation_player.play("startup")
		#print("Mouse Click/Unclick at: ", event.position)
	#elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)

func _process(delta):
	software_cursor.global_position = software_cursor.get_global_mouse_position()# - Vector2(15,20)
	
	if !can_pound:
		return
		
	pound_area.global_position = software_cursor.get_global_mouse_position()
	
	if Input.is_action_pressed("click") and can_pound:
		#print(time)
		time += delta
		#print(time)
		animation_player.play("startup")
		if time >= 2:
			animation_player.play("pound")
			can_pound = false
			time = 0
	elif Input.is_action_just_released("click") and can_pound:
		final_time = time * 100
		can_pound = false
		time = 0
		animation_player.play("pound")

func pound():
	force = final_time
	return force
	
func _on_timer_timeout():
	can_pound = true
	animation_player.play("idle")

func _on_pound_area_area_entered(area):
	if area.has_method("deform"):
		area.deform(pound())
		
func _on_pound_area_body_entered(body):
	print_debug("a")
	pound()
