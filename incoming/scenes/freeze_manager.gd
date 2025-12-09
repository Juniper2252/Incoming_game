extends Node2D

func freezeframe():
	get_tree().paused = true
	$Timer.start()

func _on_timer_timeout() -> void:
	if $"../labels/pause".isPaused == false:
		get_tree().paused = false
