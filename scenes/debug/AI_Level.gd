extends Node


export var PlayerScore = 0
export var OpponentScore = 0

func _ready():
	$CountdownLabel.visible = false
	$PlayerScore.visible = false
	$OpponentScore.visible = false

func _on_TopGoal_body_entered(body):
	if(body.name == "Ball"):
		print("Goal!")
		OpponentScore += 1
		score_achieved()
		


func _on_BottomGoal_body_entered(body):
	if(body.name == "Ball"):
		print("Goal!")
		PlayerScore += 1
		score_achieved()
		

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)


func _on_CountdownTimer_timeout():
	get_tree().call_group('VanishedBlocks', 'reset_block')
	get_tree().call_group('BallGroup', 'restart_ball')
	$CountdownLabel.visible = false
	$PlayerScore.visible = false
	$OpponentScore.visible = false

func score_achieved(): 
	$Ball.position = Vector2(186, 280)
	
	get_tree().call_group('BallGroup', 'stop_ball')
	$PlayerScore.visible = true
	$OpponentScore.visible = true
	print("CPU Score: ", OpponentScore)
	print("Player Score: ", PlayerScore)
	if OpponentScore == 3:
		$ResultLabel.text = ("CPU wins!")
		$ResultLabel.visible = true
	elif PlayerScore == 3:
		$ResultLabel.text = ("Player wins!")
		$ResultLabel.visible = true
	else:
		$CountdownTimer.start()
		$CountdownLabel.visible = true
