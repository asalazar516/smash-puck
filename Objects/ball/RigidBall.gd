extends RigidBody2D


export (int) var speed
signal infected
var rng = RandomNumberGenerator.new()
var velocity = Vector2(speed, 0)

func _ready():
	rng.randomize()
	var direction = rng.randf_range(-PI, PI)
#	get_node(".").rotation = direction
#	get_node(".").set_linear_velocity(velocity.rotated(direction))
#	self.gravity_scale = 0

#func _physics_process(delta):
#	if get_node(".").linear_velocity <= Vector2(speed, 0):
#		velocity += Vector2(1, 0)
#		get_node(".").set_linear_velocity(velocity)
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
##	pass

func _integrate_forces(state):
	var velocity_limit = 4000
	if state.linear_velocity.length() > velocity_limit:
		state.linear_velocity *= velocity_limit / state.linear_velocity.length()


func _on_Ball_body_entered(body):
	print(body.name)
