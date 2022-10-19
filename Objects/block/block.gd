extends StaticBody2D

export var Health: int

func hit_block():
#	queue_free()
	self.visible = 0
	self.set_collision_layer_bit(3, false)
	self.set_collision_mask_bit(0, false)
	self.set_collision_mask_bit(1, false)
	add_to_group("VanishedBlocks")

func reset_block():
	self.visible = 1
	self.set_collision_layer_bit(3, true)
	self.set_collision_mask_bit(0, true)
	self.set_collision_mask_bit(1, true)
