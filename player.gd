extends CharacterBody2D

var vx := 200
var vy := 200

func restart():
	pass

func jump():
	if is_on_floor_only():
		vy = -750
func _ready() -> void:
	position = Vector2(18, 600)
	
func _process(delta: float) -> void:
	vy += 3000 * delta
	if is_on_floor_only() and vy > 0:
		vy = 0
	position += Vector2(vx, vy) * delta
	if Input.is_action_pressed("salt"):
		jump()
	if is_on_wall_only():
		restart()
	move_and_slide()
	
