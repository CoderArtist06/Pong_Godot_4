extends Paddle


class_name Player1


func _process(delta: float) -> void:
	movement(delta)


func movement(delta: float) -> void:
	if Input.is_action_pressed("up_player_1") == true:
		move_paddle(-1, delta)
	elif Input.is_action_pressed("down_player_1") == true:
		move_paddle(1, delta)
