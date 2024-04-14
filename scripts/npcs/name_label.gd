extends Label

@export var types : Array[String]
@export var display_name : String

@onready var class_label = $ClassLabel

''' Agradecimientos especiales a Gor Motherfucking Down! '''
func _ready():
	randomize()
	if display_name != null && display_name != "": return
	var names = readJSON("res://scenes/resources/names.tres")
	var name_man_list = names["name"]["man"] as Array
	var name_woman_list = names["name"]["woman"] as Array
	var class_list = names["class"] as Array
	var surname_list = names["surname"] as Array
	
	if types.size() < 1: surname_list = names["surname"]
	else:
		for type in types:
			name_woman_list += names["name"][type]
			name_man_list += names["name"][type]
			#surname_list = names["surname"][type]
			#class_list = names["class"][type]
	
	var random_name_man = name_man_list.pick_random()
	var random_name_woman = name_woman_list.pick_random()
	var random_surname = surname_list.pick_random()
	var random_class = class_list.pick_random()
	
	display_name = random_name_man + " " + random_surname
	#display_name = random_name_woman + " " + random_surname
	
	text = display_name
	class_label.text = "- " + random_class 

func readJSON(json_file_path):
	var file = FileAccess.open(json_file_path, FileAccess.READ)
	var content = file.get_as_text()
	var finish = JSON.parse_string(content)
	return finish
