extends Label

var list_index: int = 0
var list_levels: Array = []
var path: String = "res://levels/comp/"

# Called when the node enters the scene tree for the first time.
func _ready():
	list_levels = get_list_of_levels(path)
	self.set_text(list_levels[list_index])

func get_list_of_levels(path):
	var dir = Directory.new()
	var files = []
	dir.open(path)
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
#			var regex = RegEx.new()
#			regex.compile("\\w-(\\d+)")
#			var splice_scene = file.search("\w")
			files.append(file)
		
	dir.list_dir_end()
	
	return files

func increment_list():
	list_index += 1
	if list_index == list_levels.size():
		list_index = 0
		self.set_text(list_levels[list_index])
	else:
		self.set_text(list_levels[list_index])
		

func decrement_list():
	list_index -= 1
	if list_index == -1:
		list_index = list_levels.size() - 1
		self.set_text(list_levels[list_index])
	else:
		self.set_text(list_levels[list_index])

func play_level():
	get_tree().change_scene(path + list_levels[list_index])
#	return list_levels[list_index]
