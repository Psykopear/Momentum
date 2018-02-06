extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var target = null
var velocity = Vector2(0, 0)

func _ready():
	self.target = get_player()
	print("Here")

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var to_target = Vector2()
	if self.target:
		to_target = self.target.position - self.position
	else:
		to_target += velocity
		velocity += Vector2(randf() - 0.5, randf() - 0.5)
	self.position += to_target * delta


func get_player():
	return get_tree().get_root().find_node('Player')