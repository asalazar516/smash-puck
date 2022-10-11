extends KinematicBody2D

var speed: int = 100
var velocity = Vector2.ZERO
var acceleration: float = 0.5
var original_velocity
var new_velocity = Vector2.ZERO


var invincible =  false setget set_invincible
signal invincibility_started
signal invincibility_finished

onready var timer = $Timer

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_finished")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)

func _ready():
	randomize()
	velocity.y = [-1, 1][randi() % 2]
	velocity.x = [-0.8, 0.8][randi() % 2]
	original_velocity = velocity
	
	

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		print(collision_object.collider.name)
#		velocity = velocity.bounce(collision_object.normal)
		
		if "Brick" in collision_object.collider.name:
			collision_object.collider.hit_brick()
		
		if "block" in collision_object.collider.name:
			collision_object.collider.hit_block()
		
		if "Hitbox" == collision_object.collider.name:
#			collision_object.collider.hit_ball()
			print(collision_object.collider.get_owner().player_id)
			start_invincibility(0.2)
			velocity.x = lerp(velocity.x, -1 * 2, acceleration)
			velocity.y = lerp(velocity.y, -1 * 2, acceleration)
			
			print("Hit")
		
		look_at(collision_object.position + -collision_object.normal)
		
		var reflect = collision_object.remainder.bounce(collision_object.normal)
		velocity = velocity.bounce(collision_object.normal)
		move_and_collide(reflect)

func stop_ball():
	speed = 0


func restart_ball():
	speed = 100
	velocity.y = [-1, 1][randi() % 2]
	velocity.x = [-0.8, 0.8][randi() % 2]


func _on_Timer_timeout():
	self.invincible = false


func _on_Ball_invincibility_started():
	self.set_collision_mask_bit(5, false)


func _on_Ball_invincibility_finished():
	self.set_collision_mask_bit(5, true)
