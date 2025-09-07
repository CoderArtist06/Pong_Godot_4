extends CanvasLayer


@onready var player_2: Label = $Player2
@onready var player_1: Label = $Player1



func _ready() -> void:
	SignalHub.connect("score_updated", Callable(self, "_on_score_update"))


func _on_score_update(score_left: int, score_right: int) -> void:
	player_1.text = str(score_left)
	player_2.text = str(score_right)
