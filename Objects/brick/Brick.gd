extends StaticBody2D

onready var animationPlayer = $AnimationPlayer
export var Health: int = 1

func _ready():
	add_to_group("Bricks")
	check_health(Health)

func hit_brick():
	Health -= 1
	check_health(Health)
	

func check_health(brick_health):
	if Health == 0:
		remove_from_group("Bricks")
		queue_free()
	if Health == 2:
		animationPlayer.play("2HP")
	if Health == 1:
		animationPlayer.play("1HP")
