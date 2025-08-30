extends Area2D


class_name Paddle


@onready var color_rect: ColorRect = $ColorRect

@export var speed: float = 300.0


var win_size: Vector2


var border: int = 8

var screen_height: float
var paddle_height: float
var bottom_limit: float

# Inizializza i valori necessari per il movimento del paddle
#
# Initialize the necessary values for paddle movement
func _ready() -> void:
	win_size = get_viewport_rect().size
	screen_height = win_size.y
	paddle_height = color_rect.get_size().y
	bottom_limit = screen_height - paddle_height - border


func move_paddle(direction: float, delta: float) -> void:
	var movement = position.y + direction * speed * delta
	# Limita il movimento tra il bordo superiore e quello inferiore dello schermo
	#
	# Limit the movement between the top edge and the bottom edge of the screen.
	movement = clampf(movement, border, bottom_limit)
	position.y = movement
