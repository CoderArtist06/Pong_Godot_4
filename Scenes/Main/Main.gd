extends Control


func _on_cpu_pressed() -> void:
	GameManager.set_mode("cpu")


func _on_player_2_pressed() -> void:
	GameManager.set_mode("player2")


func _on_extra_pressed() -> void:
	GameManager.set_mode("credit")


func _on_quit_pressed() -> void:
	get_tree().quit()
