extends RigidBody2D

func _ready():
	play_animations()

func play_animations():
	$Central/Player.play("rotate")
	$Central/Satellite1/Player.play("rotate")
	$Central/Satellite2/Player.play("rotate")
	$Central/Satellite3/Player.play("rotate")
