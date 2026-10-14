extends Button
var isPaused = false

func _on_pressed() -> void:
	get_tree().paused = true
	isPaused = true
	$"../../PauseManu".visible = true

func _on_button_pressed() -> void:
	get_tree().paused = false
	isPaused = false
	$"../../PauseManu".visible = false

func _on_button_2_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainmenu/mainmenu.tscn")
	
