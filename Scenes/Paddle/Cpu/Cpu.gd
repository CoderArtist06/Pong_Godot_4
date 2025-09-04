extends Paddle


class_name CPU



var ball: Node2D = null
var ball_position: Vector2 = Vector2.ZERO
var distance: int = 0
var move_by: int = 0


func set_ball(ball_reference) -> void:
	ball = ball_reference


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Si muove verso la palla
	#
	# It moves towards the ball
	if ball == null:
		return
	
	ball_position = ball.global_position
	distance = position.y - ball_position.y
	
	if abs(distance) > 5:
		move_by = speed * delta * (distance / (abs(distance)))
	else:
		move_by = distance
	
	position.y -= move_by
	
	position.y = clampf(position.y, paddle_half_height + border, bottom_limit)
