extends KinematicBody2D

var speed = 500
var ball

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(delta):
	move_and_slide(Vector2(get_opponent_direction(), 0) * speed)
	
func get_opponent_direction():
	if abs(ball.position.x - position.x) > 20:
		if ball.position.x > position.x:
			return 1
		else:
			return -1
	else:
		return 0
