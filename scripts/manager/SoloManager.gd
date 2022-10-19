extends Node


var time_elapsed : float = 0.0
var seconds : int = 0
var bricks : Array = []
onready var label = $"%TimerLabel"

# Called when the node enters the scene tree for the first time.
func _ready():
	bricks = get_tree().get_nodes_in_group("Bricks")
	print(bricks.size())


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_timer(delta)
	bricks = get_tree().get_nodes_in_group("Bricks")


func check_timer(delta):
	if bricks.size() > 0:
		time_elapsed += delta
		var minutes := time_elapsed / 60
		seconds = fmod(time_elapsed, 60)
		label.set_text(str("%02d:%02d" % [minutes, seconds]))
