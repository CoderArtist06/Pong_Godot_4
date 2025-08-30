extends Node2D


@onready var start_timer: Timer = $StartTimer

var ball_instance


func _ready() -> void:
	var ball_scene = load("res://Scenes/Ball_2/Ball.tscn")
	ball_instance = ball_scene.instantiate()
	add_child(ball_instance)


func _process(delta: float) -> void:
	pass


func _on_start_timer_timeout() -> void:
	ball_instance.new_ball()
