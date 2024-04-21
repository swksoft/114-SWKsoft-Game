extends CanvasLayer

# TODO: SI SE TIENE EL MARTILLO EN MANO ENTONCES NO SE PUEDE ACCEDER A LOS BOTONES DEL MENU (g)

signal done_blade
signal redo_blade
signal gain_blade
signal gain_points

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
	GLOBAL.npc_left.connect(on_npc_left)
	#time_label.text = time

func _process(delta):
	if CustomCursor.current == 0: get_tree().call_group("button", "set_disabled", true)
	elif CustomCursor.current == 1: get_tree().call_group("button", "set_disabled", false)

func lose_blade():
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

func _on_done_blade():
	GLOBAL.actual_points = int(GLOBAL.compare_polygons(GLOBAL.player_blade, GLOBAL.npc_blade))
	print_debug("DISTANCIA TOTAL: ", GLOBAL.actual_points)
	if GLOBAL.actual_points >= 20:
		lose_blade()
		GLOBAL.points += 0 * GLOBAL.POINTS_DEFAULT
		print("super mal")
	elif GLOBAL.actual_points < 20 and GLOBAL.actual_points >= 15:
		GLOBAL.points += 0.25 * GLOBAL.POINTS_DEFAULT
		print("mal")
	elif GLOBAL.actual_points < 15 and GLOBAL.actual_points >= 10:
		print("mas o menos")
		GLOBAL.points += 0.5 * GLOBAL.POINTS_DEFAULT
	elif GLOBAL.actual_points < 10 and GLOBAL.actual_points >= 5:
		GLOBAL.points += 0.75 * GLOBAL.POINTS_DEFAULT
		print("bien")
	elif GLOBAL.actual_points < 5:
		print("perfecto")
		GLOBAL.points += 2 * GLOBAL.POINTS_DEFAULT
		
	emit_signal("gain_points")

func _on_gain_points():
	blade_label.text = "x" + str(GLOBAL.blades_left)
	print("points")
	money_label.text = "$" + str(GLOBAL.points)

func on_npc_left():
	lose_blade()
