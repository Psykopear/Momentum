extends Node2D

export var MOUSE = true
export var hitpoints = 50

func _ready():
	get_node("./Body").set_mouse(MOUSE)
	$Hammer/weap00/player.play("rotate")
	$Hammer/weap00/weap03/player.play("rotate")
	$Hammer/weap00/weap02/player.play("rotate")
	$Hammer/weap00/weap01/player.play("rotate")
	Input.warp_mouse_position(get_viewport_rect().size / 2)
	self.position = get_viewport_rect().size / 2

func _on_Body_body_entered( body ):
	hitpoints -= 1
	self.get_parent().get_node("ScoreLabel").text = 'HEALT: %s' % hitpoints
	if hitpoints <= 0:
		self.get_parent().get_node("ScoreLabel").text = 'GAME OVER'
		set_process(false)
