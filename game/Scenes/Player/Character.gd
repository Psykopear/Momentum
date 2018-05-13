extends Node2D

signal death
export var MOUSE = true
export var hitpoints = 100

func _ready():
	$Body.set_mouse(MOUSE)
	$Hammer.play_animations()
	Input.warp_mouse_position(get_viewport_rect().size / 2)
	self.position = get_viewport_rect().size / 2

func _on_Body_body_entered( body ):
	$Body/Glow.apply_scale(Vector2(5,5))
	$Body/GlowTimer.start()
	hitpoints -= 1
	self.get_parent().get_node("ScoreLabel").text = 'HEALT: %s' % hitpoints
	get_parent().get_node("LifeBar").value = hitpoints
	if hitpoints <= 0:
		self.get_parent().get_node("ScoreLabel").text = 'GAME OVER'
		emit_signal('death')


func _on_GlowTimer_timeout():
	$Body/Glow.apply_scale(Vector2(1/5,1/5))
