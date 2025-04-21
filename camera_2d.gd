extends Camera2D

func _process(delta: float) -> void:
	position += Vector2(250, 0) * delta
