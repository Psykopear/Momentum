extends Particles2D

func _ready():
	print(is_emitting())
	set_emitting(true)
	print(is_emitting())