extends CharacterBody2D


var win_size: Vector2

@export var start_speed: int = 200
const ACCELERATION: int = 50
var speed: int
var direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	win_size = get_viewport_rect().size


# Imposta una nuova direzione per l'entità
#
# Set a new direction for the entity
func new_ball() -> void:
	position.x = win_size.x / 2
	position.y = win_size.y / 2
	
	speed = start_speed
	direction = random_direction()


# https://docs.godotengine.org/en/stable/tutorials/physics/using_character_body_2d.html
func _physics_process(delta: float) -> void:
	if (direction != Vector2.ZERO) == true:
		move_and_collide(direction * speed * delta)
	else:
		pass


func random_direction() -> Vector2:
	var new_dir: Vector2 = Vector2()
	new_dir.x = [1, -1].pick_random() # Right or Left
	new_dir.y = randf_range(-0.8, 0.8) # Up or Down
	return new_dir.normalized()
