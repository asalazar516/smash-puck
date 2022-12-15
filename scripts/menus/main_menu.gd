extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
#	self.set_text(list_levels[list_index])
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_QuitButton_pressed():
	get_tree().quit()


func _on_RightButton_pressed():
	get_tree().call_group("LevelLabelGroup", "increment_list")

func _on_LeftButton_pressed():
	get_tree().call_group("LevelLabelGroup", "decrement_list")


func _on_HowToButton_pressed():
	get_tree().change_scene("res://Scenes/menus/how_to.tscn")


func _on_SingleButton_pressed():
	get_tree().change_scene("res://Scenes/levels/single_selection_screen.tscn")


func _on_CompButton_pressed():
	get_tree().change_scene("res://Scenes/levels/comp_selection_screen.tscn")
