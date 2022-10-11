extends StaticBody2D


onready var game = get_owner()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func hit_ball():
	print(game)
	print(game.player_id)
