extends KinematicBody2D

var gravity = 200
var motion = Vector2()
var acceleration = 700
var max_speed = 100
var friction = 0.25
func _physics_process(delta):
	#motion.y += gravity * delta
	
	var x_input = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	
	if x_input != 0:
		motion.x += x_input * acceleration * delta
		motion.x = clamp(motion.x, -max_speed, max_speed)
	else:
		motion.x = lerp(motion.x, 0, friction)
	motion = move_and_slide(motion)
