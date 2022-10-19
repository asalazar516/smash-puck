
#OLD VERSION
#extends KinematicBody2D
#
#
#var speed = 400
#var velocity = Vector2.ZERO
#
#onready var _screen_size_y = get_viewport_rect().size.y
#onready var _screen_size_x = get_viewport_rect().size.x
#
#func _physics_process(delta):
#
#	velocity.x = int(Input.is_action_pressed("ui_down") ) - int(Input.is_action_pressed("ui_up"))
#
#	move_and_slide(velocity * speed)


extends KinematicBody2D


export var speed: int = 200
export var FRICTION: int = 500
export var ACCELERATION: int = 500
var velocity = Vector2.ZERO

enum {
	MOVE,
	ATTACK
}

var state = MOVE

var is_slap_right: bool
var is_slap_left: bool
export var player_id: int = 1

func _ready():
	animationTree.active = true
	
#	var n = String(name).to_lower()
#	_up = ("player_%s_up" % [player_id])
#	print(_up)
#	_down =("player_%s_down" % [player_id])
#	_left = ("player_%s_left" % [player_id])
#	_right = ("player_%s_right" % [player_id])
#	_slap_right = ("player_%s_slap_right" % [player_id])
#	_slap_left = ("player_%s_slap_left" % [player_id])
#	if n == "left":
#		_ball_dir = 1
#	else:
#		_ball_dir = -1
#
#var speed = 200  # speed in pixels/sec
#var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ATTACK:
			attack_state(delta)
	velocity = move_and_slide(velocity)

func move_state(delta):
	var input_vector = Vector2.ZERO
#	if Input.is_action_pressed('player_1_right'):
#		velocity.x += 1
#	if Input.is_action_pressed('player_1_left'):
#		velocity.x -= 1
#	if Input.is_action_pressed('player_1_down'):
#		velocity.y += 1
#	if Input.is_action_pressed('player_1_up'):
#		velocity.y -= 1

	input_vector.y = Input.get_action_strength("player_%s_down" % [player_id]) - Input.get_action_strength("player_%s_up" % [player_id])
	input_vector.x = Input.get_action_strength("player_%s_right" % [player_id]) - Input.get_action_strength("player_%s_left" % [player_id])
	# Make sure diagonal movement isn't faster
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * speed, ACCELERATION)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	if Input.is_action_just_pressed("player_%s_slap_right" % [player_id]):
		state = ATTACK
		is_slap_right = true
	if Input.is_action_just_pressed("player_%s_slap_left" % [player_id]):
		state = ATTACK
		is_slap_left = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://scenes/menus/main_menu.tscn")

func attack_state(delta):
	velocity = Vector2.ZERO
	if is_slap_right:
		animationState.travel("Attack - Right")
		is_slap_right = false
	if is_slap_left:
		animationState.travel("Attack - Left")
		is_slap_left = false

func attack_animation_finished():
	state = MOVE
