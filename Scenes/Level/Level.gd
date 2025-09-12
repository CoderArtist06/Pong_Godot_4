extends Node2D


@onready var start_timer: Timer = $StartTimer

const BALL = preload("res://Scenes/Ball/Ball.tscn")
const _CPU = preload("res://Scenes/Paddle/Cpu/Cpu.tscn")
const PLAYER_2 = preload("res://Scenes/Paddle/Player2/Player2.tscn")

var cpu: CPU = null
var player_2: Player2 = null

var ball_instance: Node = null
var score_left: int = 0
var score_right: int = 0
var can_score: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.set_mode("main")


func _ready() -> void:
	control()
	spawn_ball()
	start_timer.start()


func control() -> void:
	var spawn: Vector2 = Vector2(20.0, 240.0)
	
	if GameManager.mode == "player2":
		player_2 = PLAYER_2.instantiate()
		add_child(player_2)
		player_2.position = spawn
	else:
		cpu = _CPU.instantiate()
		add_child(cpu)
		cpu.position = spawn


func spawn_ball() -> void:
	if ball_instance != null:
		ball_instance.queue_free()
	
	ball_instance = BALL.instantiate()
	add_child(ball_instance)
	
	# Passa la palla alla CPU
	#
	# Pass the ball to the CPU
	if cpu != null:
		cpu.set_ball(ball_instance)


#region signal
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
#endregion
