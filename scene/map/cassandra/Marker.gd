extends TileMap


func _input(event):
	if event is InputEventMouseMotion:
		if is_mouse_over():
			# Change the cell size when the mouse hovers over the tilemap
			cell_size = Vector2(new_width, new_height)
