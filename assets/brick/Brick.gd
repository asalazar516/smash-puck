extends StaticBody2D

export var Health: int = 1

func _ready():
	# TODO: Change color when ball hits brick to decrement health
	$Sprite.modulate = Color(0.90, 5.72, 0.69)

func hit_brick():
	if Health == 0:
		queue_free()
	else:
		Health -= 1
