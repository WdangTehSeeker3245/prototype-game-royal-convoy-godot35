extends KinematicBody2D

const max_speed = 400
const accel = 1500
const friction = 600
var velocity = Vector2()

var input = Vector2.ZERO
var enemy = null
var battle = false

func _ready():
	$UICombat.hide()

func _physics_process(delta):
	player_movement(delta)
	if battle == true:
		$UICombat.show()
	else:
		$UICombat.hide()

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


func _on_AreaEngagement_body_exited(body):
	enemy = null
	battle = false



func _on_UICombat_ready():
	$UICombat.hide()
