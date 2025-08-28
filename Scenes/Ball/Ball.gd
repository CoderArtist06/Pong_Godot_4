extends Area2D


@onready var start_timer: Timer = $StartTimer

@export var speed: float = 100.0

var angle: Vector2 = Vector2.ZERO


func _ready() -> void:
	start_timer.start()


func _process(delta: float) -> void:
	if angle != Vector2.ZERO:
		position += angle * speed * delta


func _on_start_timer_timeout() -> void:
	angle = random_angle()


func random_angle() -> Vector2:
	var random_angle: int = randi_range(-70, 70)
	var angle_rad: float = random_angle * (PI / 180.0)
	# Debugging
	print("Angle: %d\nRadiant: %f\n" % [random_angle, angle_rad])
	var direction: Vector2 = Vector2(cos(angle_rad), sin(angle_rad)).normalized()
	
	return direction
