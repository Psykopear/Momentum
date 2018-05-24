extends Node2D

export (float) var SPEED = 3000
export (float) var ACCELERATION = 0.02
export (PackedScene) var Death

var target = null
var rand_velocity = Vector2(0, 0)
var hitpoints = 2

var amebadeath = load('res://Scenes/Enemy/AmebaDeath.tscn')

func _ready():
	self.target = get_player()
	randomize()

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var to_target = Vector2()
	if self.target:
		to_target += (self.target.global_position - self.global_position)
	else:
		print("No Target")
		to_target += rand_velocity
		rand_velocity += Vector2(randf() - 0.5, randf() - 0.5)
	
	to_target = to_target.normalized() * SPEED
	
	var force = Vector2()
	force += (to_target - self.linear_velocity) * ACCELERATION  # Proportional controller
	self.apply_impulse(Vector2(), force * self.mass)
	
func _on_Ameba_body_entered(obj):
	if obj.name == 'Hammer':
		var damage = obj.linear_velocity.length()/10000
		self.hitpoints -= damage
		if self.hitpoints < 0:
			var death = Death.instance()
			self.get_tree().get_root().add_child(death)
			death.set_global_position(get_global_position())
			queue_free()
		
	

func get_player():
	return get_tree().get_root().get_node('Main/Player/Body')