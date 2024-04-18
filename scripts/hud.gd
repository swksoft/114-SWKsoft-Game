extends CanvasLayer

# TODO: SE TIENE QUE SELECCIONAR Y DESELECCIONAR EL PUNTERO (martillo o cursor)
# TODO: SI SE TIENE EL MARTILLO EN MANO ENTONCES NO SE PUEDE ACCEDER A LOS BOTONES DEL MENU

var time: float = 0.0

@onready var time_label = $PanelHUD/DataGrid/TimeLabel
@onready var money_label = $PanelHUD/DataGrid/MoneyLabel

func _ready():
	pass
	
	#time_label.text = time
