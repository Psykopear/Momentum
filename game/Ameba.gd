extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (float) var SPEED = 3000
export (float) var ACCELERATION = 0.02

var target = null
var rand_velocity = Vector2(0, 0)
var hitpoints = 2

var amebadeath = load('res://AmebaDeath.tscn')

func _ready():
	self.target = get_player()
	randomize()

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var to_target = Vector2()
	if self.target:
		to_target += (get_player().global_position - self.global_position)
	else:
		print("No Target")
		to_target += rand_velocity
		rand_velocity += Vector2(randf() - 0.5, randf() - 0.5)
	
	to_target = to_target.normalized() * SPEED
	
	var force = Vector2()
	force += (to_target - self.linear_velocity) * ACCELERATION  # Proportional controller
	self.apply_impulse(Vector2(), force * self.mass)
	
func _on_Ameba_body_entered(obj):
	self.hitpoints -= 1
	print(self.hitpoints)
	if self.hitpoints < 0:
		var death = self.amebadeath.instance()
		self.get_tree().get_root().add_child(death)
		death.position = self.position
		queue_free()
		
	

func get_player():
	return get_tree().get_root().get_node('Main/Player/Body')