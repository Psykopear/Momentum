extends RigidBody2D

var _velocity = Vector2(0, 0)

var min_softness = 0.05
export(NodePath) var hammer_joint = null

var MOUSE = true
var JOYSTICK = false
var _joint = null
var _offset = Vector2(5000, 5000)

func _ready():
	get_node(hammer_joint).set_softness(min_softness)

func set_mouse(val):
	MOUSE = val
	JOYSTICK = not val

func _process(delta):
	if MOUSE:
		var dir_vect = get_global_mouse_position() - self.get_global_position()
		_velocity = dir_vect * 0.003
	elif JOYSTICK:
		var x_axis = Input.get_joy_axis(0,0)
		var y_axis = Input.get_joy_axis(0,1)
		_velocity = Vector2(x_axis, y_axis)
	
	_velocity *= pow(_velocity.length(), 3.0)
	if _velocity.length() > 1:
		_velocity = _velocity.normalized()
	
	_velocity *= 1000000
	set_linear_velocity(_velocity * delta)

func _input(event):
	if MOUSE:
		if event.is_action_pressed("drop_hammer"):
			if _joint == null:
				_joint = get_node(hammer_joint)
				_joint.set_softness(10000)
			else:
				_joint.set_softness(min_softness)
				_joint = null
		if event.is_action_pressed("zoom_out"):
			get_node("Camera2D").set_zoom(get_node("Camera2D").get_zoom() + Vector2(0.1, 0.1))
		if event.is_action_pressed("zoom_in"):
			get_node("Camera2D").set_zoom(get_node("Camera2D").get_zoom() - Vector2(0.1, 0.1))
	
	if JOYSTICK:
		if event.is_action_pressed("joy_drop_hammer"):
			if _joint == null:
				_joint = get_node(hammer_joint)
				_joint.set_softness(10000)
			else:
				_joint.set_softness(min_softness)
				_joint = null