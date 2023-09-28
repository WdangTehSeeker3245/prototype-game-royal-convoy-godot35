extends Control

func _ready():
	var bgm = $BGM_Main
	bgm.play()
	
func _on_NewGameButton_pressed():
	var decision = $Decision_SE
	decision.play()
	get_tree().change_scene("res://scene/character_story_selection/CharacterStorySelection.tscn")

func _on_ExitButton_pressed():
	get_tree().quit()
