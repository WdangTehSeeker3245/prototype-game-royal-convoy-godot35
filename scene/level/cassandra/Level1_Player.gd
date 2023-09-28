extends KinematicBody2D

const max_speed = 400
const accel = 1500
const friction = 600
var velocity = Vector2()

var input = Vector2.ZERO
var enemy = null
var battle = false

var player_army_power = 50
var enemy_army_power = 10
var maxPower = 100

signal player_wins

var swordFightSFX: AudioStreamPlayer

func _ready():
	battle = false
	$UICombat.hide()
	
func _process(delta):
	player_movement(delta)
	if battle == true:
		$UICombat.show()
		
		var progress = abs(player_army_power - enemy_army_power)
		progress = min(progress, maxPower)
		
		# Update the progress bar
		$UICombat/ArmyPowerBar.value = progress
		player_army_power += 1

		# Check for a winning condition
		if player_army_power >= maxPower:
			winner_event("Player")
		elif enemy_army_power >= maxPower:
			winner_event("Enemy")
	else:
		$UICombat.hide()
	

func winner_event(winner):
	if winner == "Player": 
		emit_signal("player_wins")

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta )
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
	
	move_and_slide(velocity)


func _on_AreaEngagement_body_entered(body):
	enemy = body
	battle = true
	$SwordFight_SFX.play()


func _on_AreaEngagement_body_exited(body):
	enemy = null
	battle = false
	$SwordFight_SFX.stop()

