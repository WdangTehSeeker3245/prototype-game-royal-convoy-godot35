extends Control




func _on_CassandraBtn_pressed():
	var decision = $Decision_SE
	decision.play()
	get_tree().change_scene("res://scene/map/cassandra/cassandra-map.tscn")
