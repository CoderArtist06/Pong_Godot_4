extends Node2D


@onready var start_timer: Timer = $StartTimer
@onready var cpu: CPU = $CPU

const BALL = preload("res://Scenes/Ball/Ball.tscn")

var ball_instance: Node = null
var score_left: int = 0
var score_right: int = 0
var can_score: bool = false


func _ready() -> void:
	spawn_ball()
	start_timer.start()


func spawn_ball() -> void:
	if ball_instance != null:
		ball_instance.queue_free()
	
	ball_instance = BALL.instantiate()
	add_child(ball_instance)
	
	# Passa la palla alla CPU
	#
	# Pass the ball to the CPU
	cpu.set_ball(ball_instance)


func _on_start_timer_timeout() -> void:
	if ball_instance != null:
		ball_instance.new_ball()
		can_score = true
		#print("timeout")


func _on_score_area_2d_left_body_entered(_body: Node2D) -> void:
	if can_score == true:
		score_left += 1
		SignalHub.emit_score_updated(score_left, score_right)
		start_timer.start()
		#print("new ball")


func _on_score_area_2d_right_body_entered(_body: Node2D) -> void:
	if can_score == true:
		score_right += 1
		SignalHub.emit_score_updated(score_left, score_right)
		start_timer.start()
		#print("new ball")
