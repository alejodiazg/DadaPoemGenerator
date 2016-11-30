extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	var x = 0
	var y = 0
	if Input.is_action_pressed('ui_up'):
		y = y - 1
	if Input.is_action_pressed('ui_down'):
		y = y + 1
	if Input.is_action_pressed('ui_left'):
		x = x - 1
	if Input.is_action_pressed('ui_right'):
		x = x + 1
	
	var movement = Vector2(x * 10, y * 10)
	move(movement)