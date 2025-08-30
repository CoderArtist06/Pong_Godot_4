extends Node2D




@onready var start_timer: Timer = $StartTimer

const BALL = preload("res://Scenes/Ball/Ball.tscn")

var ball_instance: Node = null


func _ready() -> void:
	spawn_ball()
	start_timer.start()


func spawn_ball() -> void:
	ball_instance = BALL.instantiate()
	add_child(ball_instance)


func _on_start_timer_timeout() -> void:
	if ball_instance != null:
		ball_instance.new_ball()
