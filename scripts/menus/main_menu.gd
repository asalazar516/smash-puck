extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
#	self.set_text(list_levels[list_index])
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
#	TODO: Go to scene when selecting a level
	get_tree().call_group("LevelLabelGroup", "play_level")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_RightButton_pressed():
	get_tree().call_group("LevelLabelGroup", "increment_list")

func _on_LeftButton_pressed():
	get_tree().call_group("LevelLabelGroup", "decrement_list")


func _on_HowToButton_pressed():
	get_tree().change_scene("res://scenes/menus/how_to.tscn")
