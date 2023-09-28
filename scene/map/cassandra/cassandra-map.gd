extends Node2D


func _on_Level1_button_pressed():
	var decision = $Decision_SE
	decision.play()
	get_tree().change_scene("res://scene/level/cassandra/Level1.tscn")
