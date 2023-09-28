extends KinematicBody2D

var speed = 100
var player_chase = false
var player = null

func _process(delta):
	if player_chase:
		var direction = (player.global_position - global_position).normalized()
		move_and_slide(direction * speed)

func _on_AreaDetection_body_entered(body):
	player = body
	player_chase = true

func _on_AreaDetection_body_exited(body):
	player = null
	player_chase = false
