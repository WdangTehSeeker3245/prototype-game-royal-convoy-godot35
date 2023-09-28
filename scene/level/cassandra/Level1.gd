extends Node2D

var EnemyCharacter : KinematicBody2D = null

func _ready():
	var bgm = $Combat_BGM
	bgm.play()
	$Player.connect("player_wins", self, "_on_player_wins")
	EnemyCharacter = $Enemy
	
func _on_player_wins():
	$Player/SwordFight_SFX.stop()
	$GoblinScream_SFX.play()
	if EnemyCharacter:
		EnemyCharacter.queue_free()
		$Player.disconnect("player_wins", self, "_on_player_wins")
