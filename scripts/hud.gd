extends CanvasLayer

# TODO: SE TIENE QUE SELECCIONAR Y DESELECCIONAR EL PUNTERO (martillo o cursor)
# TODO: SI SE TIENE EL MARTILLO EN MANO ENTONCES NO SE PUEDE ACCEDER A LOS BOTONES DEL MENU

signal done_blade
signal redo_blade
signal gain_blade

var time: float = 0.0

''' MONEY '''
@onready var money_label = $PanelHUD/DataGrid/MoneyLabel
''' BLADES ''' 
@onready var blade_label = $PanelHUD/BladesGrid/BladeLabel

func _ready():
	# MONEY
	money_label.text = "$" + str(GLOBAL.points)
	# BLADES LEFT
	blade_label.text = "x" + str(GLOBAL.blades_left)
	
	#time_label.text = time

func _process(delta):
	if CustomCursor.current == 0: get_tree().call_group("button", "set_disabled", false)
	elif CustomCursor.current == 1: get_tree().call_group("button", "set_disabled", true)

func lose_blade():
	GLOBAL.blades_left -= 1
	blade_label.text = "x" + str(GLOBAL.blades_left)
	if GLOBAL.blades_left <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_gain_blade():
	GLOBAL.blades_left += 1
	if GLOBAL.blades_left >= 5:
		GLOBAL.blades_left = 5 # NO SE PUEDE TENER MAS DE 5 ESPADAS

func _on_redo_button_pressed():
	#lose_blade()
	emit_signal("redo_blade")

func _on_done_button_pressed():
	emit_signal("done_blade")
