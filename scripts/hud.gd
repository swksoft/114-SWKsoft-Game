extends CanvasLayer

# TODO: SE TIENE QUE SELECCIONAR Y DESELECCIONAR EL PUNTERO (martillo o cursor)
# TODO: SI SE TIENE EL MARTILLO EN MANO ENTONCES NO SE PUEDE ACCEDER A LOS BOTONES DEL MENU

signal lose_blade
signal gain_blade

var time: float = 0.0

@onready var time_label = $PanelHUD/DataGrid/TimeLabel
@onready var money_label = $PanelHUD/DataGrid/MoneyLabel
''' BLADES ''' 
@onready var blade_label = $PanelHUD/BladesGrid/BladeLabel

func _ready():
	
	# BLADES LEFT
	blade_label.text = str(GLOBAL.blades_left)
	
	#time_label.text = time



func _on_lose_blade():
	GLOBAL.blades_left -= 1
	if GLOBAL.blades_left <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_gain_blade():
	GLOBAL.blades_left += 1
	if GLOBAL.blades_left >= 5:
		GLOBAL.blades_left = 5 # NO SE PUEDE TENER MAS DE 5 ESPADAS
