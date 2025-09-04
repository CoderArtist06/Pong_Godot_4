extends CharacterBody2D


var win_size: Vector2

var start_speed: int #= 140
var random_start_speed: Array = [220, 240, 260]
const ACCELERATION: int = 20
var speed: int
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	win_size = get_viewport_rect().size


# Imposta una nuova direzione per l'entità
#
# Set a new direction for the entity
func new_ball() -> void:
	position = win_size / 2
	
	start_speed = random_start_speed.pick_random()
	print("Start_speed: ", start_speed)
	
	speed = start_speed
	direction = random_direction()


# https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed * delta)
	var collider
	
	if collision:
		collider = collision.get_collider()
		# Se la palla colpisce il paddle
		#
		# If ball hits paddle
		if collider is Player1 or collider is CPU:
			speed += ACCELERATION
			direction = new_direction_paddle(collider)
		# Se la palla colpisce il muro
		#
		# If ball hits a wall
		else:
			direction = direction.bounce(collision.get_normal())

#region direction
func random_direction() -> Vector2:
	var new_dir: Vector2 = Vector2()
	
	new_dir.x = [1, -1].pick_random() # Right or Left
	
	var y = randf_range(-0.8, 0.8) # Up or Down
	while abs(y) < 0.2: # No start Horizontal
		y = randf_range(-0.8, 0.8)
	new_dir.y = y
	
	return new_dir.normalized()


func new_direction_paddle(collider) -> Vector2:
	var ball_y = position.y
	var paddle_y = collider.position.y
	var distance = ball_y - paddle_y
	var new_direction: Vector2
	
	# Capovolge la direzione orizzontale
	#
	# Flip the horizontal direction
	if direction.x > 0:
		new_direction.x = -1
	else:
		new_direction.x = 1
	
	new_direction.y = (distance / (collider.paddle_half_height)) * 0.8
	
	return new_direction.normalized()
#endregion
