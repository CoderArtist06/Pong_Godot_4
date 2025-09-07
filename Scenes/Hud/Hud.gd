extends CanvasLayer


@onready var player_2: Label = $Player2
@onready var player_1: Label = $Player1



func _ready() -> void:
	#SignalHub.connect("score_updated", self, "_on_score_update")
	pass


func _on_score_update(score_left: int, score_right: int) -> void:
	pass
