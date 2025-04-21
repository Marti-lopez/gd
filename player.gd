extends CharacterBody2D

var vx := 250
var vy := 200
var vr := 0

func restart():
	get_tree().reload_current_scene()

func jump():
	if is_on_floor_only():
		vy = -850
		vr = 3.5

func near_rotation(rad):
	if rad >= (7*PI/4) or rad < (PI/4):
		return 0
	elif rad >= (PI/4) and rad < 3*PI/4:
		return PI/2
	elif rad >= (3*PI/4) and rad < 5*PI/4:
		return PI
	elif rad >= 5*PI/4 and rad < (7*PI/4):
		return 3*PI/2
	else:
		return 0

func _ready() -> void:
	position = Vector2(20, 500)
	
func _process(delta: float) -> void:
	vy += 4000 * delta
	if is_on_floor_only() and vy > 0:
		vy = 0
		vr = 0
		rotation = near_rotation(rotation)
	position += Vector2(vx, vy) * delta
	
	rotation += vr * delta
	if Input.is_action_pressed("salt"):
		jump()
	if is_on_wall():
		restart()
	move_and_slide()
	if is_on_ceiling():
		restart()
