extends Node2D

export var MOUSE = true

func _ready():
	get_node("./Body").set_mouse(MOUSE)