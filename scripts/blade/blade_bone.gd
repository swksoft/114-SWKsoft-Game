extends Node2D

@onready var skeleton = $Skeleton2D

func _ready():
	print(skeleton.get_bone_count())
	print(skeleton.get_bone(3))
