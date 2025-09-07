extends Node


signal score_updated (score_left, score_right)


func emit_score_updated(score_left: int, score_right: int) -> void:
	emit_signal("score_updated", score_left, score_right)
	#print("score left: ", new_score_left)
	#print("score right: ", new_score_right)
