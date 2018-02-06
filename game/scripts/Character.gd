extends Node2D

export var MOUSE = true

func _ready():
	get_node("./Body").set_mouse(MOUSE)
	$Hammer/weap00/player.play("rotate")
	$Hammer/weap00/weap03/player.play("rotate")
	$Hammer/weap00/weap02/player.play("rotate")
	$Hammer/weap00/weap01/player.play("rotate")