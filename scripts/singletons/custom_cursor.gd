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

enum CURSOR{
	HAMMER,
	DEFAULT
}
var current = CURSOR.DEFAULT

func _ready():
	current = CURSOR.DEFAULT
	
	software_cursor.texture = sf_cursor
	software_cursor.position.x = -100
	
	animation_player.play("idle")
	
	Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)

func change_weapon():
	if current == CURSOR.HAMMER:
		current = CURSOR.DEFAULT
	elif current == CURSOR.DEFAULT:
		current = CURSOR.HAMMER
		
func get_cursor_position():
	return pound_area.global_position

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and OS.is_debug_build():
		change_weapon()
	
	match current:
		CURSOR.HAMMER:
			Input.set_custom_mouse_cursor(null, Input.CURSOR_ARROW)
			software_cursor.visible = false
		CURSOR.DEFAULT:
			Input.set_custom_mouse_cursor(hw_cursor, Input.CURSOR_ARROW)
			software_cursor.visible = true
			software_cursor.global_position = software_cursor.get_global_mouse_position()# - Vector2(15,20)
			
			if !can_pound:
				return
				
			pound_area.global_position = software_cursor.get_global_mouse_position()
			
			if Input.is_action_pressed("click") and can_pound:
				time += delta
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
	print("fuerza total: ", force)
	return force
	
func _on_timer_timeout():
	can_pound = true
	animation_player.play("idle")

func _on_pound_area_area_entered(area):
	print_debug("hit something: ", area)
	if area.has_method("deform"):
		area.deform(pound())
	elif area.has_method("crack"):
		area.crack(pound())
